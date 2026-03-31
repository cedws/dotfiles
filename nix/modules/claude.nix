{
  home.file.".claude/settings.json".text = builtins.toJSON {
    env = {
      ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic";
      API_TIMEOUT_MS = "3000000";
      ANTHROPIC_DEFAULT_HAIKU_MODEL = "glm-4.5-air";
      ANTHROPIC_DEFAULT_SONNET_MODEL = "glm-5.1";
      ANTHROPIC_DEFAULT_OPUS_MODEL = "glm-5.1";
    };
    sandbox = {
      enabled = true;
      autoAllowBashIfSandboxed = true;
      excludedCommands = [ "docker" ];
      network = {
        allowUnixSockets = [ "/var/run/docker.sock" ];
        allowLocalBinding = true;
      };
    };
    permissions = {
      allow = [ "Bash(ls *)" "Bash(find *)" "Read(~/Documents/**)" ];
      deny = [
        "Read(~/Library/**)"
        "Read(~/.ssh/**)"
        "Read(~/.aws/**)"
        "Read(~/.gnupg/**)"
        "Read(~/.password-store/**)"
        "Read(~/.netrc)"
        "Read(~/.npmrc)"
        "Read(~/.pypirc)"
        "Read(~/.docker/config.json)"
        "Read(~/.kube/**)"
        "Read(~/.fly/**)"
        "Read(~/.config/**)"
        "Read(~/.gitconfig)"
        "Read(~/.git-credentials)"
        "Read(~/.terraform.d/**)"
        "Read(~/.vault-token)"
        "Read(~/.secrets/**)"
        "Read(**/.env)"
        "Read(**/.env.*)"
        "Read(**/secrets/**)"
        "Read(**/*.pem)"
        "Read(**/*.key)"
        "Edit(~/Library/**)"
        "Edit(~/.ssh/**)"
        "Edit(~/.aws/**)"
        "Edit(~/.gnupg/**)"
        "Edit(~/.password-store/**)"
        "Edit(~/.netrc)"
        "Edit(~/.npmrc)"
        "Edit(~/.pypirc)"
        "Edit(~/.docker/config.json)"
        "Edit(~/.kube/**)"
        "Edit(~/.fly/**)"
        "Edit(~/.config/**)"
        "Edit(~/.gitconfig)"
        "Edit(~/.git-credentials)"
        "Edit(~/.terraform.d/**)"
        "Edit(~/.vault-token)"
        "Edit(~/.secrets/**)"
        "Write(~/Library/**)"
        "Write(~/.ssh/**)"
        "Write(~/.aws/**)"
        "Write(~/.gnupg/**)"
        "Write(~/.password-store/**)"
        "Write(~/.netrc)"
        "Write(~/.npmrc)"
        "Write(~/.pypirc)"
        "Write(~/.docker/config.json)"
        "Write(~/.kube/**)"
        "Write(~/.fly/**)"
        "Write(~/.config/**)"
        "Write(~/.gitconfig)"
        "Write(~/.git-credentials)"
        "Write(~/.terraform.d/**)"
        "Write(~/.vault-token)"
        "Write(~/.secrets/**)"
      ];
    };
    attribution = {
      commit = "";
      pr = "";
    };
  };

  home.file.".claude/CLAUDE.md".source = ../lib/agents.md;
}
