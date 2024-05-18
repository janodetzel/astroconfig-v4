-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "github_dark_default",

    status = {
      colors = function(hl)
        local palette = require("github-theme.palette").load "github_dark_default"
        hl.bg = palette.black.base
        hl.section_bg = palette.black.base
        hl.fg = palette.white.base
        hl.section_fg = palette.white.base
        return hl
      end,
    },
  },
}
