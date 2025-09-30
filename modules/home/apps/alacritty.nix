{ config, lib, ... }: {

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = { size = lib.mkForce 18; };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window.padding = { x = 20; y = 20; };
    };
  };

}
