{ config, pkgs, lib, ... }:

{
  xdg.configFile."opencode/AGENTS.md".source = ../lib/agents.md;
}
