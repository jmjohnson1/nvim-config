local helpers = require('functions.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return {
	-- GENERIC ENVIRONMENT
	s({trig="env", snippetType="autosnippet"},
		fmta(
			[[
			\begin{<>}
				<>
			\end{<>}
			]],
			{
				i(1),
				d(2, get_visual),
				rep(1),
			}
		),
		{condition = line_begin}
	),
	-- ENGIRONMENT WITH ONE EXTRA ARG
	s({trig="n2", snippetType="autosnippet"},
		fmta(
			[[
			\begin{<>}{<>}
				<>
			\end{<>}
			]],
			{
				i(1),
				i(2),
				d(3, get_visual),
				rep(1),
			}
		),
		{condition = line_begin}
	),
	-- ENVIRONMENT WITH TWO EXTRA ARG
	s({trig="n3", snippetType="autosnippet"},
		fmta(
			[[
			\begin{<>}{<>}{<>}
				<>
			\end{<>}
			]],
			{
				i(1),
				i(2),
				i(3),
				d(4, get_visual),
				rep(1),
			}
		),
		{condition = line_begin}
	),
	-- Equation
	s({trig="nn", snippetType="autosnippet"},
		fmta(
			[[
			\begin{equation*}
				<>
			\end{equation*}
			]],
			{
				i(1),
			}
		),
		{condition = line_begin}
	),
	-- Align
	s({trig="aln", snippetType="autosnippet"},
		fmta(
			[[
			\begin{align*}
				<>
			\end{align*}
			]],
			{
				i(1),
			}
		),
		{condition = line_begin}
	),
	-- Itemize
	s({trig="itt", snippetType="autosnippet"},
		fmta(
			[[
			\begin{itemize}
				\item <>
			\end{itemize}
			]],
			{
				i(0),
			}
		),
		{condition = line_begin}
	),
	-- Enumerate
	s({trig="enn", snippetType="autosnippet"},
		fmta(
			[[
			\begin{enumerate}
				\item <>
			\end{enumerate}
			]],
			{
				i(0),
			}
		),
		{condition = line_begin}
	),
	-- Inline math
	s({trig = "([^%l])mm", regTrig=true, wordTrig=false, snippetType="autosnippet"},
		fmta(
			"<>$<>$",
			{
				f( function(_, snip) return snip.captures[1] end ),
				d(1, get_visual),
			}
		)
	),
    -- INLINE MATH ON NEW LINE
    s({trig = "^mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "$<>$",
{
          i(1),
        })),
    -- FIGURE
    s({trig = "fig"},
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \caption{<>}
          \label{fig:<>}
          \includegraphics[width=<>\linewidth]{<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      { condition = line_begin }
    ),
    -- SVG
    s({trig = "svg"},
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \caption{<>}
          \label{fig:<>}
          \includesvg[width=<>\linewidth, inkscapelatex=false]{<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      { condition = line_begin }
    ),
}
