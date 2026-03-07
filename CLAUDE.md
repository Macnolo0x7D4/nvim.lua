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
4. `plugins/init.lua` → returns a table of imports for each category (ai, coding, editor, languages, ui, vcs)
5. Lazy.nvim recursively loads all plugin files from imported categories

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

**Performance optimizations:**
Several built-in Neovim plugins are disabled in `config/lazy.lua` for faster startup: `gzip`, `matchit`, `matchparen`, `netrwPlugin`, `tarPlugin`, `tohtml`, `tutor`, `zipPlugin`.

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

### Formatting with Conform.nvim

Located in `plugins/editor/conform.lua`. Formatting runs automatically on save with 500ms timeout.

**Configured formatters by language:**
- Lua: `stylua`
- Python: `isort`, `black`
- JavaScript: `prettierd` or `prettier` (uses first available)
- Elixir: `mix`
- Shell scripts: `shfmt` with 2-space indentation

**Fallback:** If no formatter is configured, LSP formatting is used as fallback.

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

### Git Integration (VCS)

**Gitsigns** (`plugins/vcs/gitsigns.lua`):
- Inline git change indicators in sign column
- Shows added, changed, deleted, and untracked lines
- Staged changes also visualized with separate signs

**Neogit**: Full-featured git client accessible via `<leader>gs`

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

1. Create a new file in the appropriate `plugins/` subdirectory (e.g., `plugins/editor/my-plugin.lua`)
2. Return a lazy.nvim spec table from the file
3. The plugin will be automatically discovered through the category import in `plugins/init.lua`
4. Reload with `:Lazy sync` or restart Neovim

**Example:** To add a new editor plugin, create `plugins/editor/my-plugin.lua`:
```lua
return {
  "username/plugin-name",
  event = "VeryLazy",
  opts = {},
}
```

### Modifying Configuration

- **Vim options:** Edit `lua/config/options.lua`
- **Global keybindings:** Edit `lua/config/keymaps.lua`
- **Plugin-specific settings:** Edit the plugin file in `lua/plugins/*/`
- **LSP settings:** Modify `lua/plugins/coding/lsp.lua`
- **Reload configuration:** Use `:Lazy sync` for plugins, or restart Neovim for core config changes

### Important Notes

- README.md shows the public-facing structure; all paths in the actual codebase use `lua/config/` and `lua/plugins/`
- Format-on-save is enabled by default; disable in `plugins/editor/conform.lua` if needed
- Mason will auto-install LSP servers on first buffer open for that language
