{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    includes = [
      "~/.orbstack/ssh/config"
    ];

    matchBlocks = {
      "*" = {
        user = "anon";
        extraOptions = {
          UseKeychain = "yes";
          AddKeysToAgent = "yes";
          UserKnownHostsFile = "~/.ssh/known_hosts.d/%k";
        };
      };

      "orb" = {
        extraOptions = {
          StrictHostKeyChecking = "no";
        };
      };
    };
  };
}
