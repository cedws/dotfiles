{
  xdg.configFile."uv/uv.toml".text = ''
    exclude-newer = "7 days"
  '';

  home.file.".npmrc".text = ''
    min-release-age=7 # days
    ignore-scripts=true
  '';

  home.file."Library/Preferences/pnpm/rc".text = ''
    minimum-release-age=10080 # minutes
  '';

  home.file.".bunfig.toml".text = ''
    [install]
    minimumReleaseAge = 604800 # seconds
  '';

  home.file.".digrc".text = "+search";

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
  };

  programs.k9s = {
    enable = true;

    settings = {
      k9s = {
        refreshRate = 2;
        maxConnRetry = 5;
        enableMouse = false;
        headless = false;
        logoless = true;
        crumbsless = false;
        readOnly = false;
        noExitOnCtrlC = false;
        noIcons = false;
        skipLatestRevCheck = false;

        logger = {
          tail = 100;
          buffer = 5000;
          sinceSeconds = 300;
          fullScreenLogs = false;
          textWrap = false;
          showTime = false;
        };

        currentContext = "";
        currentCluster = "";

        clusters = {
          "" = {
            namespace = {
              active = "default";
              lockFavorites = false;
              favorites = [ "default" ];
            };
            view = {
              active = "po";
            };
            featureGates = {
              nodeShell = false;
            };
            shellPod = {
              image = "busybox:1.35.0";
              command = [ ];
              args = [ ];
              namespace = "default";
              limits = {
                cpu = "100m";
                memory = "100Mi";
              };
              labels = { };
            };
            portForwardAddress = "localhost";
          };
        };

        thresholds = {
          cpu = {
            critical = 90;
            warn = 70;
          };
          memory = {
            critical = 90;
            warn = 70;
          };
        };

        screenDumpDir = "/tmp";
      };
    };
  };
}
