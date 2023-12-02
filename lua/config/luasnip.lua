require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

-- Setting LuaSnip config
require("luasnip").config.set_config({
	-- Enable autotriggered snippets
	enable_autosnippets = true,

	-- Use Tab to trigger visual selection
	store_selection_keys = "<Tab>",
})

-- Configure jumping through the tabstops
vim.cmd[[
	" Expand or jump in insert mode
	imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
	
	" Jump forward through tabstops in visual mode
	smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
]]

function leave_snippet()
	if
		((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
		and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
		and not require('luasnip').session.jump_active
	then
		require('luasnip').unlink_current()
	end
end

-- Stop snippents when leaving normal mode
vim.api.nvim_command([[
	autocmd ModeChanged * lua leave_snippet()
]])
