let
  claudeCodeProfile = builtins.toJSON {
    meta = {
      name = "claude-code-nix";
    };
    filesystem = {
      read = [
        "/nix/store"
        "$HOME/.nix-profile"
        "$HOME/.local/state/nix"
      ];
      allow = [
        "$WORKDIR"
        "$HOME/.claude"
        "$HOME/.cargo"
      ];
      allow_file = [
        "$HOME/.claude.json"
      ];
    };
    env_credentials = {
      "env://CLAUDE_CODE_OAUTH_TOKEN" = "CLAUDE_CODE_OAUTH_TOKEN";
    };
    network = {
      allow_domain = [ "*" ];
    };
  };

  opencodeProfile = builtins.toJSON {
    meta = {
      name = "opencode-nix";
    };
    filesystem = {
      read = [
        "/nix/store"
        "$HOME/.nix-profile"
        "$HOME/.local/state/nix"
      ];
      allow = [
        "$WORKDIR"
        "$HOME/.config/opencode"
      ];
    };
    network = {
      allow_domain = [ "*" ];
    };
  };
in
{
  xdg.configFile."nono/profiles/claude-code-nix.json".text = claudeCodeProfile;
  xdg.configFile."nono/profiles/opencode-nix.json".text = opencodeProfile;
}
