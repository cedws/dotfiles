function vm --description "Start a macOS VM with a mounted path"
    argparse 'vm-name=' 'mount-path=' -- $argv
    or return 1

    if not set -q _flag_vm_name; or not set -q _flag_mount_path
        echo "Usage: vm --vm-name <name> --mount-path <path>"
        return 1
    end

    set VM_NAME $_flag_vm_name
    set MOUNT_PATH $_flag_mount_path

    tart clone ghcr.io/cirruslabs/macos-sequoia-base:latest $VM_NAME

    tart run --dir $MOUNT_PATH $VM_NAME &
    set tart_pid $last_pid

    sshpass -p admin ssh -o "StrictHostKeyChecking no" -o "SetEnv TERM=xterm-256color" admin@(tart ip --wait 30 $VM_NAME)

    kill $tart_pid
end
