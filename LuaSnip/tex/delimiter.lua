local helpers = require('functions.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_tex = function () return not tex.in_mathzone() end

-- Return snippet tables
return
{
	-- LEFT/RIGHT PARENTHESIS
	s({trig = "([^%a])s%(", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\left(<>\\right)",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),
	
	-- LEFT/RIGHT SQUARE BRACKETS
	s({trig = "([^%a])s%[", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\left[<>\\right]",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),

	-- LEFT/RIGHT CURLY BRACES 
	s({trig = "([^%a])s%{", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\left\\{<>\\right\\}",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),

	-- BIG PARENTHESIS
	s({trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\big(<>\\big)",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),
	
	-- BIG SQUARE BRACKETS
	s({trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\big[<>\\big]",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),

	-- BIG CURLY BRACES 
	s({trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
	  	fmta(
			"<>\\big\\{<>\\big\\}",
			{
				f(function(_, snip) return snip.captures[1] end),
				d(1, get_visual),
			}
	  	)
	),
}
