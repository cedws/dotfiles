{ config, pkgs, lib, ... }:

{
  home.file.".codex/config.toml".text = ''
    model = "gpt-5.3-codex"
    model_reasoning_effort = "high"
    approval_policy = "on-request"
    sandbox_mode = "workspace-write"

    [projects."/Users/development/Documents/Git/aqua-registry"]
    trust_level = "trusted"

    [projects."/Users/development/Documents/Git"]
    trust_level = "trusted"

    [projects."/Users/development/Documents/Git/octopilot"]
    trust_level = "trusted"

    [projects."/Users/development/Downloads"]
    trust_level = "trusted"

    [projects."/Users/development/Downloads/Payload"]
    trust_level = "trusted"

    [projects."/Users/development/Documents/Projects/amnesia"]
    trust_level = "trusted"

    [projects."/Users/development/Downloads/instabridge"]
    trust_level = "trusted"

    [projects."/Users/development/Documents"]
    trust_level = "trusted"

    [projects."/Users/development/Downloads/instabridge/binary"]
    trust_level = "trusted"

    [projects."/Users/development/.local/share/chezmoi"]
    trust_level = "trusted"

    [sandbox_workspace_write]
    network_access = true
  '';

  home.file.".codex/AGENTS.md".source = ../lib/agents.md;
}
