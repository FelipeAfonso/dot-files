return {
	"rebelot/kanagawa.nvim",
	"catppuccin/nvim",
	{ "kepano/flexoki-neovim", name = "flexoki" },
	"rose-pine/neovim",
	"nyoom-engineering/oxocarbon.nvim",
	"bluz71/vim-moonfly-colors",
	{
		"folke/tokyonight.nvim",
		config = function()
			local path = vim.fn.expand("%:p")
			if string.find(path, "obsidian") then
				vim.cmd("colorscheme kanagawa")
			else
				vim.cmd("colorscheme rose-pine")
			end
		end,
		lazy = false,
		opts = {
			style = "storm",
			transparent = false,
			-- styles = {
			--    floats = 'transparent',
			--    sidebars = 'transparent'
			-- }
		},
		priority = 1000,
	},
}
