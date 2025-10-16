{ config, pkgs, lib, inputs, ... }:{

  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf.enable = true;

  programs.nvf.settings.vim.options = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;
    smarttab = true;
    number = true;
    relativenumber = true;
    cursorline = true;
    signcolumn = "yes:1";
    scrolloff = 8;
    showcmd = true;
    hlsearch = true;
    incsearch = true;
    ignorecase = true;
    smartcase = true;
    termguicolors = true;
    wrap = false;
  };
}
