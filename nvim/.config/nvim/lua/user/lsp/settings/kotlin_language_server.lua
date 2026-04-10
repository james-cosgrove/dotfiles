-- local on_attach = function(client, bufnr)
--     -- Enable formatting on save
--     if client.server_capabilities.documentFormattingProvider then
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
--             buffer = bufnr,
--             callback = function()
--                 vim.lsp.buf.format({ bufnr = bufnr })
--             end,
--         })
--     end
-- end

-- Configure Kotlin Language Server
return {
    -- on_attach = on_attach,
    command = { "kotlin-lsp" },
    settings = {
        kotlin_language_server = {
            runtime = {
                jdkPath = "/Users/jamesco/homebrew/bin/kotlin-lsp"
            },
            cmd = { "kotlin-lsp" },
            filetypes = {"kotlin", "kt", "kts"},
        },
    },
}
