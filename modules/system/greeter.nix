{ config, pkgs, ... }:{

services.greetd = {
  enable = true;
  settings = {
    terminal = {
      vt = 1;
    };
    default_session = {
      command = "tuigreet --cmd hyprland";
      user = "greeter";
    };
  };
};

}