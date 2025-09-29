{ config, pkgs, ... }:{

services.greetd = {
  enable = true;
  settings = {
    terminal = {
      vt = 1;
    };
    default_session = {
      command = "tuigreet --cmd hyprland --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --power-shutdown 'sudo systemctl poweroff' --power-reboot 'sudo systemctl reboot' --power-reboot 'sudo systemctl reboot'";
      user = "greeter";
    };
  };
};

}