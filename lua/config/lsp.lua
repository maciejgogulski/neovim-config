-- Basic LSP setup
local lspconfig = require("lspconfig")

-- Autocompletion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

-- LSP on_attach function: keymaps only when LSP is active
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  -- LSP keybindings
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame Symbol")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("<leader>vd", vim.diagnostic.open_float, "View Diagnostics")
end

-- Enable Python LSP (pyright) with on_attach
lspconfig.pyright.setup {
  on_attach = on_attach,
}
