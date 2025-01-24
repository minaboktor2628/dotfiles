return -- markdown preview
{
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1

    vim.keymap.set("n", "<leader>ms", ":MarkdownPreview<CR>")
    vim.keymap.set("n", "<leader>me", ":MarkdownPreviewStop<CR>")
  end,
}
