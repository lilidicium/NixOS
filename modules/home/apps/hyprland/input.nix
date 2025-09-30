{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_options = [];
      numlock_by_default = true;
      repeat_delay = 300;
      follow_mouse = 1; # focus follows mouse
      float_switch_override_focus = 0;
      sensitivity = 0;
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        scroll_factor = 0.8;
      };
    };
    gestures = {
      workspace_swipe = 1;
      workspace_swipe_fingers = 3;
      workspace_swipe_distance = 300;
      workspace_swipe_invert = 1;
      workspace_swipe_min_speed_to_force = 20;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_create_new = 1;
      workspace_swipe_forever = 0;
    };
  };
  
}