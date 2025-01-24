-- undo tree
return {
  "mbbill/undotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "Undo tree toggle" })
  end,
}
