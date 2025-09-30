{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Summon
      "SUPER, A, exec, sysmenu"
      "SUPER, T, exec, alacritty"
      "SUPER SHIFT, T, exec, [float; center; size 400 400] alacritty"
      "SUPER, B, exec, zen"
      "SUPER, D, exec, vesktop"
      "SUPER, C, exec, code"
      "SUPER, F, exec, dolphin"

      # Window
      "SUPER, Q, killactive"
      "SUPER ALT, F, togglefloating"
      "SUPER SHIFT, F, fullscreen"

      # Focus
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # Compositor
      "SUPER, M, exit"
      "SUPER ALT SHIFT, C, exec, caelestia shell"

      # Workspace (hyprnome)
      "SUPER, 1, exec, hyprnome --previous"
      "SUPER, 2, exec, hyprnome"
      "SUPER_SHIFT, 1, exec, hyprnome --previous --move"
      "SUPER_SHIFT, 2, exec, hyprnome --move"

      # Screenshot
      " , PRINT, exec, hyprshot -m region"
      "SUPER, PRINT, exec, hyprshot -m window"
    ];
    bindel = [
      # Volume & Brightness Controls
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
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