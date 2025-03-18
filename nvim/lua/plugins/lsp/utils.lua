local M = {}

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					timeout_ms = 3000,
				})
			end,
		})
	end
end

M.setup_diagnostics = function()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})
end

-- 初期化
M.setup = function()
	M.setup_diagnostics()
end

return M
