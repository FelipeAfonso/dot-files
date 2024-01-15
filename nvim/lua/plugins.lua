return {
    'tpope/vim-fugitive', -- {'xiyaowong/nvim-transparent',
    --    config = true,
    --    lazy = false,
    --    priority = 1001,
    --    opts = {
    --        extra_groups = {
    --            'NormalFloat',
    --            'Lualine'
    --        }
    --    }
    -- },
    {
        "aserowy/tmux.nvim",
        config = function(_, opts)
            require('tmux').setup(opts)
            vim.keymap.set('n', '<C-n>',
                           '<cmd>lua require("tmux").move_left()<cr>')
            vim.keymap.set('n', '<C-e>',
                           '<cmd>lua require("tmux").move_right()<cr>')
            vim.keymap.set('n', '<M-n>',
                           '<cmd>lua require("tmux").resize_left()<cr>')
            vim.keymap.set('n', '<M-e>',
                           '<cmd>lua require("tmux").resize_right()<cr>')
        end,
        opts = {
            navigation = {enable_default_keybindings = false},
            copy_sync = {enable = false},
            resize = {enable_default_keybindings = false}
        }
    }, {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = true,
        opts = {default_mappings = false}
    }, {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {'williamboman/mason.nvim', config = true},
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            {'j-hui/fidget.nvim', tag = 'legacy', opts = {}},

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim'
        }
    }, {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = {"BufReadPre ~/obsidian/**.md"},
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
        -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim", -- Optional, for completion.
            "hrsh7th/nvim-cmp",

            -- Optional, for search and quick-switch functionality.
            "nvim-telescope/telescope.nvim",

            -- Optional, an alternative to telescope for search and quick-switch functionality.
            -- "ibhagwan/fzf-lua"

            -- Optional, another alternative to telescope for search and quick-switch functionality.
            -- "junegunn/fzf",
            -- "junegunn/fzf.vim"

            -- Optional, alternative to nvim-treesitter for syntax highlighting.
            "godlygeek/tabular", "preservim/vim-markdown"
        },
        opts = {
            dir = "~/obsidian" -- no need to call 'vim.fn.expand' here

            -- see below for full list of options 👇
        },
        config = function(_, opts)
            require("obsidian").setup(opts)

            -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
            -- see also: 'follow_url_func' config option below.
            vim.keymap.set("n", "gf", function()
                if require("obsidian").util.cursor_on_markdown_link() then
                    return "<cmd>ObsidianFollowLink<CR>"
                else
                    return "gf"
                end
            end, {noremap = false, expr = true})
        end
    }, {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {'sbdchd/neoformat', init = function() vim.g.neoformat_try_node_exe = 1 end},
    {'s1n7ax/nvim-search-and-replace', config = true}, {
        "ray-x/sad.nvim",
        dependencies = {"ray-x/guihua.lua", run = "cd lua/fzy && make"},
        config = true,
        opts = {diff = 'diff-so-fancy'}
    }, {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp', -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets'

        }
    }, "rebelot/kanagawa.nvim", "catppuccin/nvim",
    {'kepano/flexoki-neovim', name = 'flexoki'}, 'rose-pine/neovim',
    'nyoom-engineering/oxocarbon.nvim', "bluz71/vim-moonfly-colors", {
        "folke/tokyonight.nvim",
        config = function()
            local path = vim.fn.expand('%:p')
            if string.find(path, 'obsidian') then
                vim.cmd 'colorscheme kanagawa'
            else
                vim.cmd 'colorscheme tokyonight-night'
            end
            vim.api.nvim_set_hl(0, 'LeapBackdrop', {link = 'Comment'})
        end,
        lazy = false,
        opts = {
            style = 'storm',
            transparent = false
            -- styles = {
            --    floats = 'transparent',
            --    sidebars = 'transparent'
            -- }
        },
        priority = 1000
    }, {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({
                replace_netrw = true,
                ui = {height = 0.95}
            })
            vim.api.nvim_set_keymap("n", "<leader>t", "", {
                noremap = true,
                callback = function()
                    require("ranger-nvim").open(true)
                end
            })
        end
    }, {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons = false,
                component_separators = '|',
                theme = 'tokyonight',
                section_separators = ''
            },
            sections = {
                lualine_c = {{'filename', path = 4}},
                lualine_y = {},
                lualine_x = {'filetype'}
            }
        }
    }, {'NvChad/nvim-colorizer.lua', config = true}, -- Fuzzy Finder ()
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({"v", "n"}, "<leader>ca",
                           require("actions-preview").code_actions)
        end
    }, {'nacro90/numb.nvim', config = true},

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end
    }, 'nvim-telescope/telescope-ui-select.nvim', {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'},
        build = ':TSUpdate'
    },
    {"chrisgrieser/nvim-early-retirement", config = true, event = "VeryLazy"},
    {'windwp/nvim-ts-autotag', opts = {enable_close_on_slash = false}}, {
        'altermo/ultimate-autopair.nvim',
        event = {'InsertEnter', 'CmdlineEnter'},
        config = function()
            require('ultimate-autopair').setup({
                -- Config goes here
            })
        end
    }, {
        'abecodes/tabout.nvim',
        opts = {
            tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
            default_shift_tab = '<C-d>', -- reverse shift default action,
            enable_backwards = true, -- well ...
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
                {open = "'", close = "'"}, {open = '"', close = '"'},
                {open = '`', close = '`'}, {open = '(', close = ')'},
                {open = '[', close = ']'}, {open = '{', close = '}'}
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
    }, {
        'ggandor/leap.nvim',
        init = function() require('leap').add_default_mappings() end
    }, 'ggandor/leap-ast.nvim',
    {'ThePrimeagen/harpoon', lazy = false, config = true}, {
        "MaximilianLloyd/tw-values.nvim",
        keys = {
            {
                "<leader>k",
                "<cmd>TWValues<cr>",
                desc = "Show tailwind CSS values"
            }
        },
        opts = {
            border = "rounded", -- Valid window border style,
            show_unknown_classes = true -- Shows the unknown classes popup
        }
    }, {
        'rest-nvim/rest.nvim',
        config = true,
        dependencies = {'nvim-lua/plenary.nvim'},
        opts = {
            result_split_in_place = true,
            result = {show_curl_command = true}
        }
    },
    {"max397574/better-escape.nvim", opts = {mapping = {'nn'}, timeout = 200}}
}
