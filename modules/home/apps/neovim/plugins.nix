{ config, pkgs, lib, inputs, ... }:{

  programs.nvf.settings.vim = {
    statusline.lualine.enable = true;
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    ui.colorizer.enable = true;
    telescope.enable = true;
    comments.comment-nvim.enable = true;
    formatter.conform-nvim.enable = true;
    git.vim-fugitive.enable = true;
    visuals.indent-blankline.enable = true;
    snippets.luasnip.enable = true;
    utility.surround.enable = true;
    lsp.enable = true;
    languages.enableTreesitter = true;
    languages.enableFormat = true;
    dashboard.alpha.enable = true;
    assistant = {
      copilot.enable = true;
      copilot.cmp.enable = false;
    };
    extraPlugins = {
      CopilotChat = {
        package = pkgs.vimPlugins.CopilotChat-nvim;
        setup = "require('CopilotChat').setup {}";
      };
    };
  };

}
