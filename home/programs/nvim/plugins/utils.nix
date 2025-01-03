{ config, pkgs, ... }: {
  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings = { style = "night"; };
    };
    #highlightOverride = {
    #  #FloatBorder.fg = "#${config.lib.stylix.colors.base0D}";
    #};
    extraPlugins = [
      pkgs.vimPlugins.actions-preview-nvim
      pkgs.vimPlugins.tiny-inline-diagnostic-nvim
    ];

    extraConfigLua =
      # lua
      ''
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, { border = "rounded" }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help, { border = "rounded" }
        )

        vim.diagnostic.config({
          float = { border = "rounded" }
        })

        require("tiny-inline-diagnostic").setup()
      '';

    plugins = {
      copilot-vim.enable = true;
      flash.enable = true;
      image = {
        enable = true;
        integrations.markdown = {
          clearInInsertMode = true;
          onlyRenderImageAtCursor = true;
        };
      };
      tmux-navigator.enable = true;
      comment.enable = true;
      nvim-autopairs.enable = true;
      friendly-snippets.enable = true;
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };
      };
      harpoon = {
        enable = true;
        enableTelescope = true;
        keymapsSilent = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<leader>hu";
          navNext = "<leader>hl";
          navPrev = "<leader>hh";
          navFile = {
            "1" = "<leader>h1";
            "2" = "<leader>h2";
            "3" = "<leader>h3";
            "4" = "<leader>h4";
          };
        };
      };

      # treesitter-context.enable = true;
    };
  };
}
