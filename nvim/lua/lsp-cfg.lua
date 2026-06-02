vim.diagnostic.config({
    virtual_text = true, -- inline errors
    signs = true,        -- signs in gutter
    underline = true,    -- underline the error
    update_in_insert = false,
    severity_sort = true,
})

-- Bindings
local lsp_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),

            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
    -- disable just the "unlinked-file" diagnostic
    client.config.settings = client.config.settings or {}
    client.config.settings["rust-analyzer"] = client.config.settings["rust-analyzer"] or {}
    client.config.settings["rust-analyzer"].diagnostics = {
        disabled = { "unlinked-file" },
    }
    if lsp_attach then lsp_attach(client, bufnr) end

    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(nil, {scope="line"})<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- languages
lspconfig.rust_analyzer.setup {
    on_attach = lsp_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            unlinkedFiles = {
                mode = "open"
            },
        }
    }
}


lspconfig.clangd.setup {
    on_attach = lsp_attach,
    capabilities = capabilities,

    on_new_config = function(new_config, new_root_dir)
        -- default safety
        new_config.init_options = new_config.init_options or {}

        -- get buffer filetype from active window
        local bufnr = vim.api.nvim_get_current_buf()
        local ft = vim.bo[bufnr].filetype

        if ft == "c" then
            new_config.init_options.fallbackFlags = {
                "-std=c11",
                "-D_DEFAULT_SOURCE",
            }
        else
            new_config.init_options.fallbackFlags = { "-std=c++20" }
        end
    end,
}

lspconfig.pylsp.setup {
    on_attach = lsp_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                -- Enable linting / error checking
                pyflakes = {
                    enabled = true,
                },
                mccabe = {
                    enabled = true,
                },
                -- Disable style-only checks if undesired
                pycodestyle = {
                    enabled = false,
                },
                jedi_completion = {
                    include_params = true,
                },
            }
        }
    }
}

lspconfig.jdtls.setup {
    on_attach = lsp_attach,
    capabilities = capabilities,
    -- cmd = {'jdtls'},
    cmd = { 'jdtls', '-jar', vim.fn.expand('~/.local/share/nvim/checkstyle/checkstyle-9.3-all.jar') },
    settings = {
        java = {
            configuration = {
                checkstyle = {
                    version = "9.3",
                    properties = {
                        -- Path to checkstyle configuration
                        basedir = vim.fn.getcwd()
                    }
                }
            },
            checkstyle = {
                configuration = {
                    -- Use sun_checks.xml or your custom configuration
                    file = vim.fn.expand('~/.local/share/nvim/checkstyle/sun_checks.xml'),
                    -- Alternative: project-specific configuration

                    -- file = "./config/checkstyle.xml"
                }
            }
        }
    },
    root_dir = require('lspconfig.util').root_pattern('.git', 'pom.xml', 'build.gradle'),
}

-- lspconfig.sqlls.setup {
--     on_attach = lsp_attach,
--     capabilities = capabilities
-- }

lspconfig.jsonls.setup {
    on_attach = lsp_attach,
    capabilities = capabilities
}

lspconfig.lua_ls.setup {
    on_attach = lsp_attach,
    capabilities = capabilities,
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',

                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library'

                    -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }

        })
    end,
    settings = {
        Lua = {}

    }
}
