-- Lua
require('onedark').setup {
  -- Main options --
  style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,          -- Show/hide background
  term_colors = true,           -- Change terminal color as per the selected theme style
  ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Lualine options --
  lualine = {
    transparent = false, -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {
    -- Visual = { bg = '#a9a9a9' },
    Visual = { bg = '#1E90FF' },
    DiffAdd = { bg = '#1E90FF' },
    DiffAdded = { fg = '#1E90FF' },
    DiffChange = { bg = '#1E90FF' },
    DiffText = { bg = '#1E90FF' },
    DiffDelete = { bg = '#ffa07a' },
    DiffRemoved = { fg = '#ffa07a' },
    DiffFile = { fg = '#0c3a3a' },
    DiffIndexLine = { fg = '#3a3a3a' },
  }, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}

require('onedark').load()
