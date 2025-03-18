local M = {}

M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show Hover" })
  

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_automd("ButWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.format({ bufnr = bufnr })
			end,
		})
	end
end

-- 初期化
M.setup = function()
  M.setup_diagnostics()
end


return M
