vim.cmd.source(vim.fn.stdpath("config") .. "/vimcfg.vim")
require("vimplug")
require("colorcheme")
require("telescope")
require("treesitter")
require("cinnamoncfg")
require("lsp-cfg")
require("luasnipcfg")
require("nvim-treecfg")
require("commentcfg")
require("knapcfg")
require("nvim-cmpcfg")
require("neogitcfg")

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.java",
    callback = function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 5000,
            filter = function(client)
                return client.name == "jdtls" -- Only use jdtls for Java
            end
        })
    end,
})
