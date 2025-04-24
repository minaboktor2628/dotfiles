return {
  "Olical/conjure",
  ft = { "clojure", "fennel", "racket" }, -- Load only for these filetypes
  config = function()
    vim.g["conjure#log#hud#enabled"] = false
    vim.g["conjure#log#enabled"] = false
    --   vim.g["conjure#filetype#racket"] = "racket"
    --   vim.g["conjure#client#racket#stdio#command"] = "racket"
  end,
}
