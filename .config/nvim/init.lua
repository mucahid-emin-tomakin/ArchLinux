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
-- INIT FILE
--
-- Variables
opt = vim.opt
g = vim.g
kmap = vim.keymap
cmd = vim.cmd
--
-- Leader key
g.mapleader = ","
--
-- Imports
require("core.lazy")       -- lazy.nvim plugin manager
require("core.mappings")   -- Mappings
require("core.scripts")    -- Scripts
require("core.settings")   -- Editor settings
--
require("plugins.configs") -- All setups and configurations
require("plugins.plugins") -- Plugins
require("plugins.setups")  -- Setup of plugins
--
-- Füge dies zu deiner init.lua hinzu
-- use 'uga-rosa/nvim-screenshot'
-- use 'nvim-lua/plenary.nvim'
--
-- Initialisiere das Überzug-Terminalprogramm
-- local function show_image_with_overzug(file)
--     local filetypes = { "png", "jpg", "jpeg", "gif", "bmp", "webp", "avif" }
--     -- Überprüfen, ob die Datei eine Bilddatei ist
--     local extension = file:match("^.+(%..+)$"):sub(2):lower()
--
--     for _, ext in ipairs(filetypes) do
--         if extension == ext then
--         -- Rufe Überzug auf, um das Bild im Terminal anzuzeigen
--             vim.fn.jobstart({ "overzug", file })
--             break
--         end
--     end
-- end
-- Füge den Auto-Command hinzu, um auf Dateiwechsel zu reagieren
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--     pattern = "*",
--     callback = function()
--         local filename = vim.fn.expand("%:p")
--         show_image_with_overzug(filename)
--     end
-- })
-- Optional: Weitere Konfigurationen hinzufügen, z. B. Automatisierung von Bildvorschauen
-- vim.api.nvim_create_user_command('PreviewImage', function(opts)
--  vim.fn.system('ueberzug file ' .. opts.args .. ' --scale 100')
-- end, { nargs = 1 })
--
-- command! -nargs=1 PreviewImage execute 'silent !ueberzug-cli simple -f <args>'
-- command! -nargs=1 PreviewImage execute 'silent !ueberzug file <args> --scale 100'
--
--
--
