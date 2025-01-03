{
  programs.nixvim.plugins = {
    #lsp-format.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function(bufnr)
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules|target|dist/") then
              return
            end

            return { timeout_ms = 1500, lsp_format = "first" }
          end
        '';
      };
    };
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        nixd = {
          enable = true;
          extraOptions = { expr = "import <nixpkgs> {}"; };
        };
        tailwindcss = {
          enable = true;
          filetypes = [ "typescript" "vue" "javascript" ];
        };
        html.enable = true;
        biome = {
          enable = true;
          filetypes = [ "typescript" "vue" "javascript" ];
        };
        volar = {
          enable = true;
          filetypes = [ "typescript" "vue" "javascript" ];
          extraOptions.init_options.vue.hybridMode = false;
        };
        ruff.enable = true;
        pylsp = {
          enable = true;
          #jedi_completion.fuzzy = true;
        };

        marksman.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    none-ls = {
      enable = true;
      sources = {
        completion = { luasnip.enable = true; };
        diagnostics = {
          golangci_lint.enable = true;
          statix.enable = true;
          #pylint.enable = true;
        };
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
          golines.enable = true;
          gofumpt.enable = true;
          #black.enable = true;
          #prettier.enable = true;
        };
      };
    };

  };
}
