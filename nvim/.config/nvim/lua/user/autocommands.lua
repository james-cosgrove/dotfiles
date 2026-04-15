local format = function()
  vim.lsp.buf.format {
    async = false,
    timeout_ms = 3000,
    filter = function(client) return client.name ~= "ts_ls" end
  }
end

vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup end

  augroup _explorer
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ :NvimTreeOpen :cd argv()[0] | endif
  augroup end
]])

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = format,
})

-- Show indicator on last line to visualize final newline presence
vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "TextChanged", "TextChangedI"}, {
  callback = function()
    local ns = vim.api.nvim_create_namespace("final_newline_indicator")
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    
    local line_count = vim.api.nvim_buf_line_count(0)
    if vim.bo.endofline then
      -- Show indicator that file has proper final newline
      vim.api.nvim_buf_set_extmark(0, ns, line_count - 1, 0, {
        virt_text = {{" $", "Comment"}},
        virt_text_pos = "eol",
      })
    end
  end,
})

-- augroup _diagnostics
-- autocmd!
-- autocmd CursorMoved * lua vim.diagnostic.open_float()
-- augroup END
