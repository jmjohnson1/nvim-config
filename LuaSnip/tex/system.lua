local helpers = require('functions.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return {
	-- Document class
	s({trig = "dcc", snippetType="autosnippet"},
		fmta(
			[=[ 
			\documentclass[<>]{<>}
			]=],
			{
				i(1, "letterpaper"),
				i(2, "article"),
			}
		),
		{condition = line_begin}
	),
	-- Use a latex package
	s({trig = "pack", snippetType="autosnippet"},
		fmta(
			[[
			\usepackage{<>}
			]],
			{
				d(1, get_visual),
			}
		),
		{condition = line_begin}
	),
	-- Import a latex file
	s({trig = "inn", snippetType="autosnippet"},
		fmta(
			[[
			\input{<><>}
			]],
			{
				i(1, "~/.config/latex/templates/"),
				i(2)
			}
		),
		{condition = line_begin}
	),
}
