-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.code_actions.refactoring,

      null_ls.builtins.formatting.swiftformat,
      null_ls.builtins.diagnostics.swiftlint,

      require "none-ls.diagnostics.eslint",
      require "none-ls.code_actions.eslint",
      require "none-ls.code_actions.eslint",
      -- require "none-ls.diagnostics.eslint_d",
      -- require "none-ls.code_actions.eslint_d",
    }
    return config -- return final config table
  end,
}
