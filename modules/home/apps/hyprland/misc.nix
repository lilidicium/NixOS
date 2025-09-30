{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    misc = {
      layers_hog_keyboard_focus = true;
      initial_workspace_tracking = 0;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = false;
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      enable_swallow = false;
      enable_anr_dialog = true; # app not responding
      anr_missed_pings = 20;
    };
    ecosystem = {
      no_donation_nag = true;
      no_update_news = false;
    };
    debug = {
      disable_logs = false;
    };
  };
}