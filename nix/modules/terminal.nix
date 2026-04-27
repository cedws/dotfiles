{
  xdg.configFile."ghostty/config".text = ''
    title = "Ghostty"
    theme = "Ayu Mirage"

    background-opacity = 0.8
    clipboard-read = allow
    copy-on-select = false
    cursor-style = bar
    focus-follows-mouse = true
    macos-non-native-fullscreen = true
    macos-option-as-alt = true
    macos-titlebar-style = tabs
    macos-window-shadow = false
    mouse-hide-while-typing = true
    quit-after-last-window-closed = true
    unfocused-split-opacity = 0.8
    window-padding-x = 8
    window-padding-y = 8
    window-save-state = always
    window-theme = system

    font-family = "JetBrains Mono"
    font-size = 16

    keybind = global:cmd+backquote=toggle_quick_terminal
    quick-terminal-position = top
    quick-terminal-screen = mouse
    quick-terminal-animation-duration = 0
    quick-terminal-autohide = true

    keybind = cmd+d=new_split:right
    keybind = cmd+shift+d=new_split:down
    keybind = cmd+ctrl+left=goto_split:left
    keybind = cmd+ctrl+right=goto_split:right
    keybind = cmd+ctrl+up=goto_split:up
    keybind = cmd+ctrl+down=goto_split:down
    keybind = cmd+shift+enter=toggle_split_zoom
    keybind = cmd+shift+e=equalize_splits

    keybind = alt+2=text:€
    keybind = alt+3=text:#
    keybind = cmd+right=text:\x05
    keybind = alt+left=esc:b
    keybind = alt+right=esc:f
    keybind = cmd+delete=text:\x0b
    keybind = cmd+backspace=text:\x15
    keybind = opt+delete=esc:d
  '';
}
