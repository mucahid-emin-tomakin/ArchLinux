--
--
--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
	require "nvchad.mappings"
	require("custom-mappings.mappings-fzflua")
	require("custom-mappings.mappings-lsp")
	map("n", ";", ":",  "CMD enter command mode" )
	map("i", "jk", "<ESC>", "Go normal mode")
	map("n", ";", ":", { desc = "CMD enter command mode" })
	map('i', '<C-h>', '<C-w>') -- CTRL+backspace
	map("n", "<S-Tab>", ":b#<CR>", opts)
	map("n", "<leader>e", "<cmd>ShowFileInTree<CR>", opts)
--
--
--