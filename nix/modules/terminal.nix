{ config, pkgs, lib, ... }:

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
    shell-integration-features = no-cursor,no-sudo,no-title
    unfocused-split-opacity = 0.8
    window-padding-x = 8
    window-padding-y = 8
    window-save-state = always
    window-theme = system

    font-family = "JetBrains Mono"
    font-size = 16

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
