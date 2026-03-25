{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    signing.format = null;

    settings = {
      url."ssh://git@github.com/" = {
        insteadOf = "https://github.com/";
      };

      commit.verbose = true;
      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
      merge.autoStash = true;
      init.defaultBranch = "master";
      rerere.enabled = true;

      user.useConfigOnly = true;

      gpg.format = "ssh";
      gpg.ssh.defaultKeyCommand = "sh -c 'echo key::$(ssh-add -L)'";

      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };
  };

  programs.gitui = {
    enable = true;
  };
}
