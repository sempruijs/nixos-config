{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "github_light_high_contrast";
      editor = {
        auto-format = true;
        completion-trigger-len = 0;
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        color-modes = true;
        indent-guides.render = true;
        file-picker.hidden = false;
        auto-pairs = true;
        lsp.display-messages = true;
        bufferline = "always";
        statusline = {
          left = [ "mode" "spinner" "file-name" ];
          right = [ "diagnostics" "position" "total-line-numbers" "file-encoding" ];
        };
      };
      keys.normal = {
        space.q = ":wqa";
        space.Q = ":qa!";
        space.W = ":w!";
      };
      keys.insert = {
        h.h = "normal_mode";
      };
    };
 
    # languages = [
    #   {
    #     name = "rust";
    #     config = {
    #       checkOnSave.command = "clippy";
    #       # Careful! If you enable this, then a lot of errors
    #       # will no longer show up in Helix. Do not enable it.
    #       # cargo.allFeatures = true; <- do NOT enable me
    #     };
    #   }
    # ];    
  };
}
