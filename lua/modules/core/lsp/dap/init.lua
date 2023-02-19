local M = {}


function M.setup()
    local ensure_installed = {
        "codelldb",
    }

    require("mason-nvim-dap").setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
        automatic_setup = true,
    })

    -- require("mason-nvim-dap").setup_handlers({})

    require("modules.core.lsp.dap.dapui")
end

return M
