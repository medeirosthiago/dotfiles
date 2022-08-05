local colors = require("onenord.colors").load()

local onenord_local = {}

onenord_local.normal = {
  a = { bg = colors.active, fg = colors.cyan, gui = "bold" },
  b = { fg = colors.blue, bg = colors.active },
  c = { fg = colors.fg, bg = colors.active },
}

onenord_local.insert = {
  a = { bg = colors.active, fg = colors.light_green, gui = "bold" },
  b = { fg = colors.active, bg = colors.light_green },
  c = { fg = colors.active, bg = colors.light_green },
}

onenord_local.command = {
  a = { bg = colors.active, fg = colors.yellow, gui = "bold" },
  b = { fg = colors.active, bg = colors.yellow },
  c = { fg = colors.active, bg = colors.yellow },
}

onenord_local.visual = {
  a = { bg = colors.active, fg = colors.purple, gui = "bold" },
  b = { fg = colors.active, bg = colors.purple },
  c = { fg = colors.active, bg = colors.purple },
}

onenord_local.replace = {
  a = { bg = colors.active, fg = colors.red, gui = "bold" },
  b = { fg = colors.active, bg = colors.red },
  c = { fg = colors.active, bg = colors.red },
}

onenord_local.inactive = {
  a = { fg = colors.light_gray, bg = colors.floating, gui = "bold" },
  b = { fg = colors.light_gray, bg = colors.floating },
  c = { fg = colors.light_gray, bg = colors.active },
}



require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = onenord_local,
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
