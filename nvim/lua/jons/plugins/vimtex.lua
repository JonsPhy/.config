return {
  "lervag/vimtex",
  init = function()
    -- Viewer settings
    vim.g.vimtex_view_method = 'skim'    -- For Wayland compatibility, avoid xdotool
    vim.g.vimtex_context_pdf_viewer = 'okular'     -- External PDF viewer for the Vimtex menu

    vim.g.vimtex_compiler_method = 'latexmk'              -- Set compiler method 
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "../out", -- Set the output directory
    }

    -- Formatting settings
    -- vim.g.vimtex_format_enabled = true             -- Enable formatting with latexindent
    -- vim.g.vimtex_format_program = 'latexindent'

    -- Indentation settings
    vim.g.vimtex_indent_enabled = false            -- Disable auto-indent from Vimtex
    vim.g.tex_indent_items = false                 -- Disable indent for enumerate
    vim.g.tex_indent_brace = false                 -- Disable brace indent

    -- Suppression settings
    vim.g.vimtex_quickfix_mode = 0                 -- Suppress quickfix on save/build
    vim.g.vimtex_log_ignore = {                    -- Suppress specific log messages
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    }

    -- Other settings
    vim.g.vimtex_mappings_enabled = true          -- Disable default mappings
    vim.g.mapleader = " "                         -- Keymapping leader to SPC 
    vim.g.tex_flavor = 'latex'                     -- Set file type for TeX files
  end,
}
