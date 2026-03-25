{ config, pkgs, lib, ... }:

{
  home.file.".orbstack/vmconfig.json".text = builtins.toJSON {
    "docker.set_context" = false;
    "power.pause_on_sleep" = false;
    "setup.use_admin" = true;
  };
}
