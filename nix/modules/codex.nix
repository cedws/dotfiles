{ config, pkgs, lib, ... }:

{
  home.file.".codex/config.toml".text = ''
    model = "gpt-5.4"
    model_reasoning_effort = "high"
    approval_policy = "on-request"
    sandbox_mode = "workspace-write"

    [sandbox_workspace_write]
    network_access = true
  '';

  home.file.".codex/AGENTS.md".source = ../lib/agents.md;
}
