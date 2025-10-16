{ config, lib, inputs, ... }:{
  
  programs.nvf.settings.vim.languages = {
    nix.enable = true;
    bash.enable = true;
    rust.enable = true;
    python.enable = true;
    yaml.enable = true;
  };
}
