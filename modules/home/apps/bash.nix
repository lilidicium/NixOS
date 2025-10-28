{ config, pkgs, ... }: {

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    nerdfetch
    '';
    shellAliases = {
      pls = "sudo";
      please = "sudo $(history -p !!)";
      rb = "sudo cp ~/.config/noctalia/gui-settings.json /etc/nixos/modules/home/dotfiles/noctalia/settings.json && sudo nixos-rebuild switch --impure";
      rbtest = "sudo nixos-rebuild test";
      cleanup = "sudo rm /nix/var/nix/gcroots/auto/* && sudo nix-collect-garbage -d && sudo nix-store --optimise";
    };
    #initExtra = ''
    #exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    #'';
    
  };

  #programs.fish = {
    #enable = true;
    #interactiveShellInit = ''
      #set fish_greeting
      #export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      #fastfetch
    #'';
    #shellAliases = {
      #pls = "sudo";
      #please = "sudo $(history -p !!)";
      #rb = "sudo nixos-rebuild switch --impure";
      #rbtest = "sudo nixos-rebuild test";
      #cleanup = "sudo rm /nix/var/nix/gcroots/auto/* && sudo nix-collect-garbage -d && sudo nix-store --optimise";
    #};
    #plugins = [{
      #name = "tide"; src = pkgs.fishPlugins.tide.src;
    #}];
  #};

}
