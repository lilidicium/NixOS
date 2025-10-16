{ host, ... }:
let
in {
  
  imports = [
    ./languages.nix
    ./options.nix
    ./plugins.nix
    ./theme.nix
  ];

}
