{ config, pkgs, ... }:

{
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
				rebuild = "git stage . && sudo nixos-rebuild switch --impure";
				test = "git stage . && sudo nixos-rebuild test";
			};
  };
}
