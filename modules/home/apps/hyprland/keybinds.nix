{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {

    bindi = [
    ];
    bindin = [
      "SUPER, mouse:272, global, caelestia:launcherInterrupt"
      "SUPER, mouse:273, global, caelestia:launcherInterrupt" 
      "SUPER, mouse:274, global, caelestia:launcherInterrupt"
      "SUPER, mouse:275, global, caelestia:launcherInterrupt" 
      "SUPER, mouse:276, global, caelestia:launcherInterrupt"
      "SUPER, mouse:277, global, caelestia:launcherInterrupt"
      "SUPER, mouse_up, global, caelestia:launcherInterrupt"
      "SUPER, mouse_down, global, caelestia:launcherInterrupt"
    ];
    bind = [

      "SUPER, A, global, caelestia:launcher"

      # Summon
      "SUPER, T, exec, alacritty"
      "SUPER, B, exec, zen"
      "SUPER, C, exec, nvim"
      "SUPER, F, exec, dolphin"

      # Banish
      "SUPER, X, togglespecialworkspace, banished"

      # Dropdown
      "SUPER, grave, exec, pypr toggle term"
      "SUPER, D, exec, togglespecialworkspace, discord"
      "SUPER, Z, exec, togglespecialworkspace, zen"

      # Window
      "SUPER, Q, killactive"
      "SUPER ALT, F, togglefloating"
      "SUPER SHIFT, F, fullscreen"

      # Focus
      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"
      "SUPER, k, movefocus, u"
      "SUPER, j, movefocus, d"

      # Compositor
      "SUPER, M, exit"
      "SUPER, Esc, global, caelestia:session"

      # Reinitialize TODO: FIX
      "SUPER ALT SHIFT, C, exec, killall -KILL .pypr-wrapped"
      "SUPER ALT SHIFT, C, exec, killall -KILL .quickshell-wrapped"
      "SUPER ALT SHIFT, C, exec, caelestia shell; pypr; hyprctl reload"

      # Workspaces
      "SUPER, 1, exec, hyprnome --previous"
      "SUPER, 2, exec, hyprnome"
      "SUPER_SHIFT, 1, exec, hyprnome --previous --move"
      "SUPER_SHIFT, 2, exec, hyprnome --move"
      "SUPER SHIFT, X, movetoworkspace, special:banished"

      # Screenshot
      " , PRINT, exec, hyprshot -m region"
      "SHIFT, PRINT, exec, hyprpicker -r"
      "SHIFT, PRINT, exec, hyprshot -m region"
      "SUPER, PRINT, exec, hyprshot -m window"
      "SUPER  SHIFT, PRINT, exec, hyprpicker -m region"
      "SUPER  SHIFT, PRINT, exec, hyprshot -m window"
    ];
    bindel = [
      # Volume & Brightness Controls
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"

      "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
      "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%-"

      ",XF86AudioMute, exec, wpctl set-mute 1 @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute 1 @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];
    bindl = [
      # Media Controls
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
    ];
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
    
  };

}
