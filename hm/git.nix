{ confige, pkgs, ...}:
{
  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "sem pruijs";
    userEmail = "sem@pruijs.net";
    # lfs.enable = true;
    signing = {
      signByDefault = true;
      key = "~/.ssh/id_rsa.pub";
    };
    extraConfig = {
      color.ui = true;
      github.user = "sempruijs";
      gpg.format = "ssh";
      init.defaultBranch = "main";
    };
  };
}
