{ config, pkgs, lib, inputs, ... }:{

  programs.nvf.settings.vim.theme = {
    enable = true;
    name = lib.mkForce "catppuccin";
    style = lib.mkForce "macchiato";
    transparent = lib.mkForce true;
  };

}
