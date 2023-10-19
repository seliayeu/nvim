local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-K>"] = cmp.mapping(function(_) luasnip.expand() end, { "i", "s" }),
        ["<C-L>"] = cmp.mapping(function(_) luasnip.jump(-1) end, { "i", "s" }),
        ["<C-J>"] = cmp.mapping(function(_) luasnip.jump(1) end, { "i", "s" }),

        ["<C-E>"] = cmp.mapping(function(_)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    experimental = {
        ghost_text = true,
    },

})
