return {
  "lervag/vimtex",
  lazy = false, -- load on startup
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      -- build_dir = "build",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-file-line-error",
        "-verbose",
        "-shell-escape",
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-auxdir=aux",
        -- "-outdir=build",
      },
    }
  end,
}
