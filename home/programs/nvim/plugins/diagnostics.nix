{
  programs.nixvim = {
    diagnostics = {
      virtual_text = false;
      underline = true;

      # signs = {
      #   text = config.lib.nixvim.toRawKeys {
      #     "vim.diagnostic.severity.ERROR" = diagnostics.ERROR;
      #     "vim.diagnostic.severity.WARN" = diagnostics.WARN;
      #     "vim.diagnostic.severity.INFO" = diagnostics.INFO;
      #     "vim.diagnostic.severity.HINT" = diagnostics.HINT;
      #   };
      # };
    };
  };
}
