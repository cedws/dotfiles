{
  pkgs,
  lib,
  llm-agents,
  llama-cpp,
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
    stateVersion = "24.11";

    sessionVariables = {
      VISUAL = "vim";
      EDITOR = "$VISUAL";
      K9S_CONFIG_DIR = "$HOME/.config/k9s";
      GOPRIVATE = "github.com/cedws";
      GOTELEMETRY = "off";
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
      android-tools
      apktool
      aria2
      bun
      caligula
      chezmoi
      cosign
      cue
      discord
      dolt
      duckdb
      fd
      ffmpeg
      firefox
      flyctl
      websocat
      frida-tools
      gh
      ghidra-bin
      ghostty-bin
      gnupg
      go
      goreleaser
      htop
      hugo
      just
      keepassxc
      keepassxc
      kubectl
      kubernetes-helm
      libkrun-efi
      mitmproxy
      mpv
      nil
      nixd
      obsidian
      openjdk
      proton-pass
      proton-vpn
      radare2
      ripgrep
      scorecard
      secretive
      spotify
      step-cli
      tailscale-gui
      talosctl
      tart
      terraform
      terragrunt
      tokei
      trufflehog
      uv
      vhs
      wget
      wireshark
      yt-dlp
      yubikey-manager
      zed-editor
      zizmor
    ]
    ++ [
      (llm-agents.packages.${system}.claude-code.override { disableTelemetry = true; })
      llm-agents.packages.${system}.codex
      llm-agents.packages.${system}.opencode
      llama-cpp.packages.${system}.default
    ];
}
