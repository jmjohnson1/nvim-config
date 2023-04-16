local helpers = require('functions.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_tex = function () return not tex.in_mathzone() end

-- Return snippet tables
return {
	s({trig=";a", snippetType="autosnippet"},
		{
			t("\\alpha"),
		}
	),

	s({trig=";b", snippetType="autosnippet"},
		{
			t("\\beta"),
		}
	),

	s({trig=";g", snippetType="autosnippet"},
		{
			t("\\gamma"),
		}
	),

	s({trig=";G", snippetType="autosnippet"},
		{
			t("\\Gamma"),
		}
	),

	s({trig=";d", snippetType="autosnippet"},
		{
			t("\\delta"),
		}
	),

	s({trig=";D", snippetType="autosnippet"},
		{
			t("\\Delta"),
		}
	),

	s({trig=";e", snippetType="autosnippet"},
		{
			t("\\varepsilon"),
		}
	),

	s({trig=";z", snippetType="autosnippet"},
		{
			t("\\zeta"),
		}
	),

	s({trig=";h", snippetType="autosnippet"},
		{
			t("\\eta"),
		}
	),

	s({trig=";th", snippetType="autosnippet"},
		{
			t("\\theta"),
		}
	),

	s({trig=";Th", snippetType="autosnippet"},
		{
			t("\\Theta"),
		}
	),

	s({trig=";k", snippetType="autosnippet"},
		{
			t("\\kappa"),
		}
	),

	s({trig=";l", snippetType="autosnippet"},
		{
			t("\\lambda"),
		}
	),

	s({trig=";L", snippetType="autosnippet"},
		{
			t("\\Lambda"),
		}
	),

	s({trig=";m", snippetType="autosnippet"},
		{
			t("\\mu"),
		}
	),

	s({trig=";n", snippetType="autosnippet"},
		{
			t("\\nu"),
		}
	),

	s({trig=";x", snippetType="autosnippet"},
		{
			t("\\xi"),
		}
	),

	s({trig=";X", snippetType="autosnippet"},
		{
			t("\\Xi"),
		}
	),

	s({trig=";pi", snippetType="autosnippet"},
		{
			t("\\pi"),
		}
	),

	s({trig=";Pi", snippetType="autosnippet"},
		{
			t("\\Pi"),
		}
	),

	s({trig=";rho", snippetType="autosnippet"},
		{
			t("\\rho"),
		}
	),

	s({trig=";s", snippetType="autosnippet"},
		{
			t("\\sigma"),
		}
	),
	
	s({trig=";S", snippetType="autosnippet"},
		{
			t("\\Sigma"),
		}
	),

	s({trig=";ta", snippetType="autosnippet"},
		{
			t("\\tau"),
		}
	),
	s({trig=";f", snippetType="autosnippet"},
		{
			t("\\phi"),
		}
	),
	s({trig=";F", snippetType="autosnippet"},
		{
			t("\\Phi"),
		}
	),
	s({trig=";c", snippetType="autosnippet"},
		{
			t("\\chi"),
		}
	),
	s({trig=";ps", snippetType="autosnippet"},
		{
			t("\\psi"),
		}
	),
	s({trig=";Ps", snippetType="autosnippet"},
		{
			t("\\Psi"),
		}
	),
	s({trig=";o", snippetType="autosnippet"},
		{
			t("\\omega"),
		}
	),
	s({trig=";O", snippetType="autosnippet"},
		{
			t("\\Omega"),
		}
	),
}
