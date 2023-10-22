{
    enable = true;
    settings = {
      scrollback_lines = 1000000;
      enable_audio_bell = true;
      update_check_interval = 0;
      wheel_scroll_multiplier = 1;
      wheel_scroll_min_lines = 1;
      touch_scroll_multiplier = 1;
      confirm_os_window_close = 0;
      shell_integration = "enabled";
      macos_option_as_alt = true;
    };
    font = {
      size = 40; 
      name = "JetBrains Mono";
    };
    keybindings = {
      "kitty_mod+n" = "new_os_window_with_cwd";
    };
    theme = "GitHub Light High Contrast";
  }