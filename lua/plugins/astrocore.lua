-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        winresizer_start_key = "<C-w>r",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        ["<C-h>"] = { require("smart-splits").move_cursor_left, desc = "Move cursor left" },
        ["<C-j>"] = { require("smart-splits").move_cursor_down, desc = "Move cursor down" },
        ["<C-k>"] = { require("smart-splits").move_cursor_up, desc = "Move cursor up" },
        ["<C-l>"] = { require("smart-splits").move_cursor_right, desc = "Move cursor right" },
        ["<C-BS>"] = { "<C-w>", desc = "Delete last word" },
        ["<A-BS>"] = { "<C-w>", desc = "Delete last word" },
      },
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- center line in buffer
        ["<C-u>"] = { "<C-u>zz", desc = "Center on <C-u>" },
        ["<C-d>"] = { "<C-d>zz", desc = "Center on <C-d>" },

        -- better increment/decrement
        ["-"] = { "<c-x>", desc = "Descrement number" },
        ["+"] = { "<c-a>", desc = "Increment number" },

        ["gr"] = {
          "<cmd>lua require('telescope.builtin').lsp_references({})<CR>",
          desc = "References",
        },
        ["gd"] = {
          "<cmd>lua require('telescope.builtin').lsp_definitions({})<CR>",
          desc = "Go to definitions",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
