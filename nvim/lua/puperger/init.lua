local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
    active = {},
    inactive={}

}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1],{
    provider = 'vi_mode',
    hl = function ()
        return {
            name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            fg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold',
        }
    end,
    right_sep = ' ',
    icon = '',
})
table.insert(components.active[1],{
    provider = 'position'
})


table.insert(components.active[2],{
    provider = 'Puperger'
})

table.insert(components.active[3],{
    provider = 'line_percentage'
})
table.insert(components.active[3],{
    provider = 'scroll_bar',
    hl = function ()
        return {
            fg = '#22FCCC',
        }
    end
})

require('feline').setup({
    default_bg = '#1F1F23',
    default_fg = '#D0D0D0',
    components = components,
})
