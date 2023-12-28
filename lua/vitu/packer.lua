-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use('nvim-treesitter/playground')
    -- use { 'sheerun/vim-polyglot' }
    -- use { 'sheerun/vimrc' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use('jose-elias-alvarez/null-ls.nvim')

    -- Copilot
    use('github/copilot.vim')

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    require('rose-pine').setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'auto',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'moon',
        disable_background = true,
        disable_float_background = false,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
            background_nc = '_experimental_nc',
            panel = 'surface',
            panel_nc = 'base',
            border = 'highlight_med',
            comment = 'muted',
            link = 'iris',
            punctuation = 'subtle',

            error = 'love',
            hint = 'iris',
            info = 'foam',
            warn = 'gold',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            }
            -- or set all headings at once
            -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
            ColorColumn = { bg = 'love', blend = 10 },

            -- Blend colours against the "base" background
            CursorLine = { bg = 'foam', blend = 10 },
            StatusLine = { fg = 'love', bg = 'love', blend = 10 },
            ["@variable"] = { fg = 'text' },

            -- By default each group adds to the existing config.
            -- If you only want to set what is written in this config exactly,
            -- you can set the inherit option:
            Search = { bg = 'gold', inherit = false },
        }
    })

    -- vim.cmd('colorscheme rose-pine')

    -- Não gostei
    use { "catppuccin/nvim", as = "catppuccin" }
    --vim.cmd('colorscheme catppuccin-latte')

    use { "rebelot/kanagawa.nvim", as = "kanagawa" }
    --vim.cmd('colorscheme kanagawa-wave')

    use { "bluz71/vim-moonfly-colors", as = "moonfly" }
    --vim.cmd('colorscheme moonfly')

    use { "JoosepAlviste/palenightfall.nvim", as = "palenightfall" }
    --vim.cmd('colorscheme palenightfall')

    -- Não gostei
    use { "AhmedAbdulrahman/vim-aylin", as = "aylin" }
    -- vim.cmd('colorscheme aylin')

    -- Não gostei
    use { 'kartikp10/noctis.nvim', as = "noctis", requires = { 'rktjmp/lush.nvim' } }
    --vim.cmd('syntax on')
    --vim.cmd('colorscheme noctis')

    -- Não gostei
    use { 'dasupradyumna/midnight.nvim', as = "midnight" }
    -- vim.cmd('colorscheme midnight')

    use { 'sainnhe/sonokai', as = 'sonokai' }
    -- vim.cmd('colorscheme sonokai')

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    use { 'christoomey/vim-tmux-navigator' }

    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'psliwka/vim-smoothie' }
    use { 'tpope/vim-fugitive' }
end)
