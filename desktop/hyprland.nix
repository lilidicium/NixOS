{ host, config, pkgs, ... }:let

in {
	home.packages = with pkgs; [
		swww	
	];

	systemd.user.targets.hyprland-session.Unit.Wants = [
		"xdg-desktop-autostart.target"
	];

	# TODO: wallpaper git sync
	
	wayland.windowManager.hyprland = {
		enable = true;
		package = pkgs.hyprland;
		systemd = {
			enable = true;
			enableXdgAutostart = true;
			variables = ["--all"];
		};
		
		xwayland = { 
			enable = true; 
		};
		
		settings = {
			
			exec-once = [

				"caelestia shell"
				"hyprctl setcursor rose-pine-hyprcursor 36"
				
				#"killall -q waybar; sleep .5 && waybar"
				#"killall -q swaync;sleep .5 && swaync"
			];

			bindr = [
	#			"SUPER, SUPER_L, exec, sherlock"
			];

			bind = [

				# Summon
				"SUPER, A, exec, sherlock"
				"SUPER, T, exec, alacritty"
				"SUPER, B, exec, zen-browser"
				"SUPER, D, exec, vesktop"
				
				# Window
				"SUPER, Q, killactive"
				"SUPER SHIFT, F, togglefloating"

				# Focus
				"SUPER, left, movefocus, l"
				"SUPER, right, movefocus, r"
				"SUPER, up, movefocus, u"
				"SUPER, down, movefocus, d"
								
				# Compositor
				"SUPER, M, exit"

				# Workspace (hyprnome)
				"SUPER, 1, exec, hyprnome --previous"
				"SUPER, 2, exec, hyprnome"
				"SUPER_SHIFT, 1, exec, hyprnome --previous --move"
				"SUPER_SHIFT, 2, exec, hyprnome --move"

				# Screenshot
				" , PRINT, exec, hyprshot -m output"
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

			windowrule = [
				"suppressevent maximize, class:.*"
				"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];

			animation = [
				"workspaces, 1, 3, default, slidefade 20%"
			];
			
			input = {
				kb_layout = "us";
				kb_options = [
				
				];
				numlock_by_default = true;
				repeat_delay = 300;
				follow_mouse = 1;
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
				workspace_swipe_distance = 500;
				workspace_swipe_invert = 1;
				workspace_swipe_min_speed_to_force = 30;
				workspace_swipe_cancel_ratio = 0.3;
				workspace_swipe_create_new = 1;
				workspace_swipe_forever = 0;
			};

			general = {
				"$modifier" = "SUPER";
				layout = "dwindle";
				gaps_in = 5;
				gaps_out = 10;
				border_size = 0;
				resize_on_border = false;
			};

			misc = {
				layers_hog_keyboard_focus = true;
				initial_workspace_tracking = 0;
				mouse_move_enables_dpms = true;
				key_press_enables_dpms = false;
				disable_hyprland_logo = true;
				disable_splash_rendering = false;
				enable_swallow = false;
				vfr = true; # variable refresh rate
				vrr = 2;
				enable_anr_dialog = true; # app not responding
				anr_missed_pings = 20;
			};

			dwindle = {
				pseudotile = false;
				preserve_split = false;
				force_split = 2;
			};

			decoration = {
				rounding = 15;
				blur = {
					enabled = false;
					size = 5;
					passes = 3;
					ignore_opacity = false;
					new_optimizations = true;
				};
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
				};
			};

			xwayland = {
				force_zero_scaling = true;
			};

			ecosystem = {
				no_donation_nag = true;
				no_update_news = false;
			};

			cursor = {
				sync_gsettings_theme = true;
				no_hardware_cursors = 2; # 1 for off
				enable_hyprcursor = true;
				warp_on_change_workspace = 2;
				no_warps = true;
			};
			
			render = {
				explicit_sync = 1; # (1/2) (off/on)
				explicit_sync_kms = 1;
				direct_scanout = 0;
			};

			master = {
				new_status = "master";
				new_on_top = 1;
				mfact = 0.5;
			};

			debug = {
				disable_logs = false;
			};
		};
		
		extraConfig = ''
		
			monitor = eDP-1, preferred, auto, 1
			
			device { 
				name = razer-razer-basilisk-v3-pro-mouse
				sensitivity = -0.8
			}

			device { 
				name = razer-razer-basilisk-v3-pro-1
				sensitivity = -0.8
			}

			device { 
				name = tpps/2-elan-trackpoint
				sensitivity = -0.7
			}
						
		'';
		# ${extraMonitorSettings}
		# layerrule = blur, waybar
		# (uncomment and put inside quotes to use)
	};
}
