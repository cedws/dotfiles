{
  pkgs,
  lib,
  llm-agents,
  system,
  ...
}:

{
  imports = [
    ../modules/brave.nix
    ../modules/cherrystudio.nix
    ../modules/claude.nix
    ../modules/codex.nix
    ../modules/editors.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/mise.nix
    ../modules/opencode.nix
    ../modules/orbstack.nix
    ../modules/ssh.nix
    ../modules/terminal.nix
    ../modules/tools.nix
  ];

  home = {
    username = "development";
    homeDirectory = "/Users/development";
    stateVersion = "24.11";

    sessionVariables = {
      VISUAL = "vim";
      EDITOR = "$VISUAL";
      K9S_CONFIG_DIR = "$HOME/.config/k9s";
      GOPRIVATE = "github.com/cedws";
      SSH_AUTH_SOCK = "$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh";
      HOMEBREW_AUTO_UPDATE_SECS = "86400";
    };

    sessionPath = [
      "$HOME/.cargo/bin"
      "$HOME/.orbstack/bin"
      "$HOME/go/bin"
      "$HOME/bin"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.git.settings.user = {
    name = lib.mkDefault "Connor Edwards";
    email = lib.mkDefault "38229097+cedws@users.noreply.github.com";
  };

  home.packages =
    with pkgs;
    [
      age
      aria2
      chezmoi
      cue
      discord
      duckdb
      fd
      ffmpeg
      firefox
      frida-tools
      ghostty-bin
      gnupg
      htop
      hugo
      just
      keepassxc
      kubectl
      kubernetes-helm
      mpv
      nil
      nixd
      obsidian
      proton-pass
      proton-vpn
      radare2
      ripgrep
      scorecard
      secretive
      spotify
      tailscale-gui
      talosctl
      tart
      terraform
      terragrunt
      tokei
      trufflehog
      vhs
      wget
      wireshark
      yt-dlp
      yubikey-manager
      zed-editor
    ]
    ++ [
      (llm-agents.packages.${system}.claude-code.override { disableTelemetry = true; })
      llm-agents.packages.${system}.codex
      llm-agents.packages.${system}.opencode
    ];
}
