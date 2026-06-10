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
  local fzf = require("fzf-lua")
  map("n", "gm", fzf.marks, "FZF Marks")
  map("n", "<leader>da", fzf.diagnostics_workspace, "FZF Diagnostics")
  map("n", "<leader>ds", function() fzf.diagnostics_workspace({ severity_only = 1 }) end, "FZF Diagnostics (errors)")
  map("n", "gr", fzf.lsp_references, "FZF References")
  map("n", "gR", fzf.lsp_references, "FZF References")
  map("n", "<leader>fs", function()
    if vim.bo.filetype == "razor" then
      require("fzf-lua-pickers-razor-outline").pick()
    else
      fzf.lsp_document_symbols()
    end
  end, "Symbols / Razor Outline")
  map("n", "<leader>i", fzf.lsp_implementations, "FZF Implementations")
  map("n", "T", fzf.buffers, "FZF Buffers")
  -- overrides
  map("n", "<leader>ff", fzf.files, "FZF Files")
  map("n", "<leader>fz", fzf.grep_curbuf, "FZF grep current buffer")
  map("n", "<leader>fw", fzf.live_grep, "FZF Live grep")
  map("n", "<leader>gt", fzf.git_status, "FZF Git status")
  map("n", "<leader>fo", fzf.oldfiles, "FZF Old files")
  map("n", "<leader>qo", fzf.quickfix, "FZF Quickfix")
  map("n", "<leader>qO", fzf.lgrep_quickfix, "FZF Grep → quickfix")
  map("n", "<leader>ca", fzf.lsp_code_actions, "FZF Code actions")
  map("n", "<leader>?", fzf.builtin, "FZF Builtins")
--
--
--