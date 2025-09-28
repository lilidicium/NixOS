{ config, pkgs, ... }:{

stylix = {
enable = true;
  fonts = {
    serif = {
      package = pkgs.paratype-pt-serif;
      name = "PT Serif"; };
    sansSerif = {
      package = pkgs.inter;
      name = "Inter"; };
    monospace = {
      package = pkgs.nerd-fonts.fantasque-sans-mono;
      name = "FantasqueSansM Nerd Font"; };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji"; };
  };
};

}