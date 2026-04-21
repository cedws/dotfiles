{
  programs.fish = {
    enable = true;

    shellAliases = {
      rg = "rg --no-ignore -F";
      fd = "fd --no-ignore";
      zed = "zeditor";
    };

    shellInit = ''
      if command -q mise
          mise activate fish | source
      end

      if command -q direnv
          direnv hook fish | source
      end

      if command -q /opt/workbrew/bin/brew
          eval (/opt/workbrew/bin/brew shellenv)
      else if command -q /opt/homebrew/bin/brew
          eval (/opt/homebrew/bin/brew shellenv)
      end

      if command -q brew
          if test -f (brew --prefix)/share/google-cloud-sdk/path.fish.inc
              source (brew --prefix)/share/google-cloud-sdk/path.fish.inc
          end
          fish_add_path (brew --prefix)/opt/openjdk/bin
          fish_add_path (brew --prefix)/opt/libpq/bin
      end

      if test -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
          . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      end
    '';

    interactiveShellInit = ''
      set fish_greeting
      set -gx MANPATH $MANPATH $HOME/.local/share/man-get
    '';

    functions = {
      otp = {
        description = "Generate OTP code using YubiKey";
        body = ''
          ykman oath accounts code -s $argv | pbcopy; and echo "OTP code copied to clipboard"
        '';
      };

      claude-zai = {
        description = "Run claude with z.ai";
        body = ''
          set -lx ANTHROPIC_BASE_URL https://api.z.ai/api/anthropic
          set -lx ANTHROPIC_AUTH_TOKEN (security find-generic-password -s claude-zai -w)
          set -lx ANTHROPIC_DEFAULT_HAIKU_MODEL glm-4.5-air
          set -lx ANTHROPIC_DEFAULT_SONNET_MODEL glm-5.1
          set -lx ANTHROPIC_DEFAULT_OPUS_MODEL glm-5.1
          set -lx API_TIMEOUT_MS 3000000
          claude $argv
        '';
      };

      claude-oauth = {
        description = "Run claude with OAuth token";
        body = ''
          set -lx CLAUDE_CODE_OAUTH_TOKEN (security find-generic-password -s claude-oauth -w)
          claude $argv
        '';
      };

      vm = {
        description = "Start a macOS VM with a mounted path";
        body = ''
          argparse 'vm-name=' 'mount-path=' 'no-graphics' -- $argv
          or return 1

          if not set -q _flag_vm_name; or not set -q _flag_mount_path
              echo "Usage: vm --vm-name <name> --mount-path <path> [--no-graphics]"
              return 1
          end

          set VM_NAME $_flag_vm_name
          set MOUNT_PATH $_flag_mount_path

          tart clone ghcr.io/cirruslabs/macos-sequoia-base:latest $VM_NAME

          set tart_args --no-audio --no-clipboard --dir $MOUNT_PATH
          if set -q _flag_no_graphics
              set -a tart_args --no-graphics
          end

          tart run $tart_args $VM_NAME &
          set tart_pid $last_pid

          sshpass -p admin ssh -o "StrictHostKeyChecking no" -o "SetEnv TERM=xterm-256color" admin@(tart ip --wait 30 $VM_NAME)

          kill $tart_pid
        '';
      };
    };
  };
}
