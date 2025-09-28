# maggie's NixOS config

### What's new:
- split home.nix and configuration.nix into modules, located at `/modules/home` and `/modules/system`
- homogenized formatting and improved readability by adding (and removing) comments

### What I'm working on:
- modularizing hyprland.nix
- cleaning up flake.nix
- swapping out the nwg launchers for sysmenu
- figuring out how to implement non-.nix configuration files (e.g. userchrome.css for firefox)