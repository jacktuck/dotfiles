local theme = require('lualine.themes.base16')
theme.normal.a.gui= 'bold'
theme.insert.a.gui= 'bold'
theme.visual.a.gui= 'bold'
theme.replace.a.gui= 'bold'

require('lualine').setup {
  options = {
    theme = theme,
    section_separators = '',
    component_separators = '',
    always_divide_middle = false,
  }
}
