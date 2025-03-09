return {pkgs={{name="noice.nvim",source="lazy",file="lazy.lua",dir="/home/tomaking/.local/share/nvim/lazy/noice.nvim",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,},{name="plenary.nvim",source="lazy",file="community",dir="/home/tomaking/.local/share/nvim/lazy/plenary.nvim",spec={"nvim-lua/plenary.nvim",lazy=true,},},{name="telescope.nvim",source="rockspec",file="telescope.nvim-scm-1.rockspec",dir="/home/tomaking/.local/share/nvim/lazy/telescope.nvim",spec={"telescope.nvim",build=false,specs={{"nvim-lua/plenary.nvim",lazy=true,},},},},},version=12,}