# Macnolo0x7D4's Neovim Config

A modern, feature-rich Neovim configuration focused on productivity and seamless development experience.

## Features

- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient, lazy-loaded plugin management
- **LSP Support**: Full Language Server Protocol integration via Mason + lspconfig, with auto-formatting on save (conform.nvim)
- **Code Completion**: nvim-cmp with LSP, LuaSnip snippets, and GitHub Copilot sources
- **AI Assistants**: GitHub Copilot for inline suggestions and CodeCompanion for chat-based AI (Gemini / OpenAI)
- **Testing Framework**: Neotest with Elixir adapter for running tests directly from Neovim
- **UI Enhancements**:
  - Trouble.nvim for diagnostics
  - Noice.nvim for enhanced command-line UI
  - Snacks.nvim for dashboard, notifications, and Zen mode
- **Navigation**:
  - Telescope for fuzzy finding (files, grep, buffers, projects)
  - Harpoon for quick file pinning and switching
  - Flash.nvim for fast in-buffer motion
  - nvim-tree for file tree browsing
- **Git Integration**: Neogit, Gitsigns, and Git blame
- **TMux Integration**: Smooth navigation between Neovim and tmux panes

## Requirements

- Neovim >= 0.11.0
- Git
- A Nerd Font (for icons)
- NodeJS (for some LSP features)

## Installation

1. Backup your existing Neovim configuration if you have one:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/Macnolo0x7D4/nvim-config.git ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

4. The configuration will automatically install lazy.nvim and all required plugins on first start.

## Key Mappings

`<leader>` is set to `<space>`.

### Finder / Navigation
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fp` | Projects |
| `<leader>fh` | Help tags |
| `<leader>f<space>` | Harpoon marks |
| `<leader>ha` | Add file to Harpoon |
| `<leader>hh` | Toggle Harpoon menu |
| `<leader>1`–`5` | Jump to Harpoon slot 1–5 |
| `<leader>e` | Toggle file tree |

### LSP (attached per-buffer)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `grn` | Rename symbol |
| `gca` | Code action |
| `grf` | Find references |

### Testing
| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run tests in current file |
| `<leader>tT` | Run all tests |
| `<leader>tl` | Run last test |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Toggle output panel |
| `<leader>tS` | Stop tests |

### Editing & Formatting
| Key | Action |
|-----|--------|
| `<leader>F` | Format buffer |
| `s` / `S` | Flash search / Flash treesitter |

### Git
| Key | Action |
|-----|--------|
| `<leader>gs` | Open Neogit |

### Diagnostics & AI
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle Trouble diagnostics |
| `<leader>cs` | Toggle Trouble symbols |
| `<leader><space>` | CodeCompanion actions |

### Windows & UI
| Key | Action |
|-----|--------|
| `<leader>wv` | Vertical split |
| `<leader>ws` | Horizontal split |
| `<leader>wr` | Equalize splits |
| `<leader>ww` | Close split |
| `<leader>z` | Toggle Zen mode |

## Structure

- `init.lua` — Entry point, loads `lua/config/`
- `lua/config/options.lua` — Neovim options
- `lua/config/keymaps.lua` — Global key mappings (leader, window, visual-mode line movement)
- `lua/config/lazy.lua` — Lazy.nvim bootstrap and initialization
- `lua/plugins/` — Plugin specs, organised into categories:
  - `ai/` — Copilot, CodeCompanion
  - `coding/` — LSP, completion, Mason, Treesitter, Trouble, Neotest
  - `editor/` — Telescope, file tree, conform, motion, Harpoon, tmux
  - `languages/` — Java (jdtls + DAP), Elixir, database
  - `ui/` — Colorscheme, Lualine, Noice, Snacks
  - `vcs/` — Neogit, Gitsigns, Git blame

## Customization

- **Options** — Edit `lua/config/options.lua`
- **Global key mappings** — Edit `lua/config/keymaps.lua`
- **Add a plugin** — Create a new file in the appropriate `lua/plugins/<category>/` directory and return a lazy.nvim spec table; it will be picked up automatically
- **Remove a plugin** — Delete its file from `lua/plugins/`
- **Change the colorscheme** — Edit `lua/plugins/ui/colorscheme.lua` and update the `colorize()` call

## Credits

- All plugin authors for their amazing work
- Neovim team for creating such an extensible editor