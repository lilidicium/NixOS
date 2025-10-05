{ config, pkgs, lib, inputs, ... }:{

  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme.enable = true;
        theme.name = lib.mkForce "catppuccin";
        theme.transparent = true;

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        ui.colorizer.enable = true;
        comments.comment-nvim.enable = true;
        formatter.conform-nvim.enable = true;
        git.vim-fugitive.enable = true;
        visuals.indent-blankline.enable = true;
        snippets.luasnip.enable = true;
        utility.surround.enable = true;
        lsp.enable = true;

        options = {
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
        };

        languages = {                           
          enableTreesitter = true;
          enableFormat = true;

          nix.enable = true;
          bash.enable = true;
          rust.enable = true;
          python.enable = true;
          yaml.enable = true;
        };

        dashboard = {
          alpha = {
            enable = true;
          };
        };

      };
    };
  };

}
