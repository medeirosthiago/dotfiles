local cp = require("catppuccin.palettes").get_palette()
local config = require("catppuccin.config").options
local custom_cappuccin = {}

custom_cappuccin.normal = {
	a = { fg = cp.blue, bg = cp.mantle, gui = "bold" },
	b = { bg = config.transparent_background and "NONE" or cp.mantle, fg = cp.blue },
	c = { bg = config.transparent_background and "NONE" or cp.mantle, fg = cp.text },
}

custom_cappuccin.insert = {
	a = { fg = cp.green, bg = cp.base, gui = "bold" },
  b = { fg = cp.surface1, bg = cp.teal },
  c = { fg = cp.surface1, bg = cp.teal },
}

custom_cappuccin.command = {
	a = { fg = cp.peach, bg = cp.base, gui = "bold" },
  b = { fg = cp.surface1, bg = cp.peach },
  c = { fg = cp.surface1, bg = cp.peach },
}

custom_cappuccin.visual = {
	a = { fg = cp.mauve, bg = cp.base, gui = "bold" },
  b = { fg = cp.surface1, bg = cp.mauve },
  c = { fg = cp.surface1, bg = cp.mauve },
}

custom_cappuccin.replace = {
	a = { fg = cp.red, bg = cp.base, gui = "bold" },
  b = { fg = cp.surface1, bg = cp.red },
  c = { fg = cp.surface1, bg = cp.red },
}

custom_cappuccin.inactive = {
	a = { bg = cp.mantle, hg = cp.blue },
  b = { bg = cp.mantle, hg = cp.surface1, gui = "bold" },
	c = { bg = cp.mantle, hg = cp.overlay0 },
}



require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = custom_cappuccin,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
    lualine_b = {
      {'branch', icons_enabled = false},
      'diff',
      {'diagnostics', sources={'nvim_diagnostic'}}
    },
    lualine_c = {
      '%=',
      {'filetype', icon_only = true},
      {'filename', path = 2, file_status = true}
    },
    lualine_x = {'encoding'},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}  -- fugitive or quickfix?
}
