---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = "close",
        },
      },
      layout_config = {
        vertical = {
          prompt_position = "top",
          mirror = true,
          preview_cutoff = 40,
          preview_height = 0.5,
        },
        width = 0.95,
        height = 0.95,
      },
      path_display = { truncate = 3 },
    },
    pickers = {
      diagnostics = {
        layout_strategy = "vertical",
      },
      lsp_references = {
        show_line = false,
        path_display = { truncate = 6 },
      },
    },
  },
}
