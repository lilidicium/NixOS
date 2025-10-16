{ config, ... }: {

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      		export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      		fastfetch
      	'';
    shellAliases = {
      pls = "sudo";
      please = "sudo $(history -p !!)";
      rb = "sudo nixos-rebuild switch --impure";
      rbtest = "sudo nixos-rebuild test";
      cleanup = "sudo rm /nix/var/nix/gcroots/auto/* && sudo nix-collect-garbage -d && sudo nix-store --optimise";
    };
  };

}
