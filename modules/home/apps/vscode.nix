{ config, pkgs, ... }:{

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        github.copilot-chat
        jnoortheen.nix-ide
        vscodevim.vim
      ];
      keybindings = [
        {
          key = "ctrl+c";
          command = "workbench.action.terminal.copySelection";
          when = "terminalFocus && terminalProcessSupported && terminalTextSelected";
        }
        {
          key = "ctrl+v";
          command = "workbench.action.terminal.paste";
          when = "terminalFocus && terminalProcessSupported";
        }
      ];
      userSettings = {
        "chat.editor.fontFamily" = "FantasqueSansM Nerd Font";
        "chat.editor.fontSize" = 16.0;
        "debug.console.fontFamily" = "FantasqueSansM Nerd Font";
        "debug.console.fontSize" = 16.0;
        "editor.fontFamily" = "FantasqueSansM Nerd Font";
        "editor.fontSize" = 16.0;
        "editor.inlayHints.fontFamily" = "FantasqueSansM Nerd Font";
        "editor.inlineSuggest.fontFamily" = "FantasqueSansM Nerd Font";
        "editor.minimap.sectionHeaderFontSize" = 10.285714285714286;
        "github.copilot.enable.*" = false;
        "markdown.preview.fontFamily" = "Inter";
        "markdown.preview.fontSize" = 16.0;
        "scm.inputFontFamily" = "FantasqueSansM Nerd Font";
        "scm.inputFontSize" = 14.857142857142858;
        "screencastMode.fontSize" = 64.0;
        "terminal.integrated.fontSize" = 16.0;
        "workbench.colorTheme" = "Stylix";
      };
    };
  };

}