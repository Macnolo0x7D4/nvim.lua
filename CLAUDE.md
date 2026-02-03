# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Architecture

This is a personal Neovim configuration built with lazy.nvim, organized into modular plugin categories.

### Requirements

- Neovim >= 0.11.0
- Git
- A Nerd Font (for icons)
- NodeJS (for LSP features)

### Directory Structure

```
lua/
├── config/               # Core configuration
│   ├── init.lua         # Loads options, keymaps, lazy
│   ├── options.lua      # Vim options
│   ├── keymaps.lua      # Global keybindings
│   └── lazy.lua         # Lazy.nvim bootstrap
└── plugins/             # Plugin specifications
    ├── ai/              # Copilot, CodeCompanion
    ├── coding/          # LSP, cmp, mason, treesitter, tests
    ├── editor/          # telescope, tree, conform, motion, harpoon
    ├── languages/       # java, elixir, db
    ├── ui/              # colorscheme, statusline, noice, snacks
    └── vcs/             # git, gitsigns, blame
```

### Plugin Management with Lazy.nvim

**Boot sequence:**
1. `init.lua` → requires `"config"`
2. `config/init.lua` → loads options, keymaps, and lazy
3. `config/lazy.lua` → bootstraps lazy.nvim and loads plugins from `"plugins"`
4. `plugins/init.lua` → imports all plugin category modules

**Plugin file pattern:**
```lua
return {
  {
    "owner/plugin-name",
    event = "EventName",        -- Lazy loading trigger
    dependencies = {...},       -- Required plugins
    config = function() ... end, -- Setup logic
    opts = {...},               -- Passed to setup()
  }
}
```

**Lazy loading strategies used:**
- Event-based: `event = "InsertEnter"` (completion), `event = "VeryLazy"` (UI)
- Command-based: `cmd = "Trouble"`, `cmd = "Mix"`
- Filetype-based: `ft = "java"`, `ft = "elixir"`
- Key-based: `keys = {...}` for immediate keybinding availability

### LSP Configuration Pattern

LSP keybindings are dynamically attached to buffers using `LspAttach` autocmd in `plugins/coding/lsp.lua`:

```lua
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Keybindings are set with buffer = args.buf
  end,
})
```

**Global capabilities:**
`_G.cmp_nvim_lsp_capabilities` stores merged capabilities for all LSP servers to access, combining base LSP capabilities with nvim-cmp capabilities.

### Completion Architecture

**Chain:** nvim-cmp → LuaSnip (snippets) + nvim_lsp + copilot + buffer sources

**Integration:** Autopairs automatically closes brackets on completion confirm.

### Key Leader and Prefixes

**Leader:** `<space>`

**Prefix conventions:**
- `<leader>f` - Finder (telescope): `ff` (files), `fg` (grep), `fb` (buffers), `fp` (projects)
- `<leader>e` - Explorer (nvim-tree toggle)
- `<leader>F` - Format buffer
- `<leader>h` - Harpoon: `ha` (add), `hh` (menu), `1-5` (quick select)
- `<leader>w` - Window management and tmux navigation
- `<leader>g` - Git: `gs` (neogit status)
- `<leader>x` - Trouble: `xx` (diagnostics), `cs` (symbols)
- `<leader>t` - Tests: `tt` (run nearest), `tf` (file), `tT` (all), `ts` (summary), `to` (output)
- `<leader>c` - Code actions (language-specific, e.g., Java refactoring)
- `<leader>z` - Zen mode toggle
- `<leader><space>` - CodeCompanion (AI chat)

**LSP keybindings (attached on LspAttach):**
- `gd` - Go to definition
- `K` - Hover documentation
- `gi` - Go to implementation
- `grn` - Rename symbol
- `gca` - Code action
- `grf` - Find references

**Motion (Flash.nvim):**
- `s` - Flash search
- `S` - Flash treesitter
- `r` - Remote flash (operator pending)

### Language-Specific Configuration

**Java (nvim-jdtls):**
- Complex setup with workspace management per project
- Loads formatting from `lang-servers/intellij-java-google-style.xml`
- DAP (debugger) integration configured
- Custom refactoring keybindings: `crv`, `crc`, `crm`

**Elixir:**
- Mix.nvim for project management
- Neotest adapter for ExUnit tests

### Testing with Neotest

Configured in `plugins/coding/tests.lua` with language adapters. Tests run within Neovim with inline results.

### Tool Installation (Mason)

LSP servers, formatters, and linters are managed through Mason. Auto-install configured servers using `mason-lspconfig`.

### Adding New Plugins

1. Create a new file in the appropriate `plugins/` subdirectory
2. Return a lazy.nvim spec table
3. Lazy.nvim will automatically load it on next restart
4. No need to manually require it in `plugins/init.lua` if following the category import pattern

### Modifying Configuration

- **Vim options:** Edit `lua/config/options.lua`
- **Global keybindings:** Edit `lua/config/keymaps.lua`
- **Plugin-specific settings:** Edit the plugin file in `lua/plugins/*/`
- **LSP settings:** Modify `lua/plugins/coding/lsp.lua`

### Note on README

The README.md references outdated paths (`lua/macnolo/`) from a previous version. Current paths use `lua/config/` instead.
