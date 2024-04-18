{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.showBottomLine = false;
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
      os.copyToClipboardCmd = "printf {{text}} | pbcopy";
    };
  };
}
