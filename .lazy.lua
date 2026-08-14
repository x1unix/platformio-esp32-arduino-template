local function require_executable(path)
	assert(vim.fn.executable(path) == 1, "Required executable not found: " .. path .. ". Run 'make compiledb' to install toolchain.")

	return path
end

-- clang lsp config with correct toolchain path.
return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			local clangd = require_executable(vim.fn.stdpath("data") .. "/mason/bin/clangd")

			local toolchain_bin = vim.fn.expand("~/.platformio/packages/toolchain-xtensa-esp32/bin")

			local gcc = require_executable(toolchain_bin .. "/xtensa-esp32-elf-gcc")

			local gxx = require_executable(toolchain_bin .. "/xtensa-esp32-elf-g++")

			vim.lsp.config("clangd", {
				cmd = {
					clangd,
					"--query-driver=" .. gcc .. "," .. gxx,
				},
			})
		end,
	},
}
