require("toggleterm").setup {
  size = 60,
  open_mapping = [[<c-t>]],
  hide_numbers = true,   -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,       -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true,   -- whether or not the open mapping applies in insert mode
  persist_size = false,
  direction = "vertical",
  close_on_exit = true,   -- close the terminal window when the process exits
}
