# Macnolo0x7D4's Neovim Config

A modern, feature-rich Neovim configuration focused on productivity and seamless development experience.

## Features

- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin management
- **LSP Support**: Full Language Server Protocol integration with auto-formatting
- **Code Completion**: Powerful completion with nvim-cmp and GitHub Copilot integration
- **Testing Framework**: Integrated with neotest for running tests directly from Neovim
- **UI Enhancements**:
  - Trouble.nvim for better diagnostic display
  - Noice.nvim for enhanced command-line UI
  - Customized dashboard
- **Navigation**: 
  - Telescope for fuzzy finding
  - Harpoon for quick file navigation
  - Advanced tree-sitter integration
- **Git Integration**: Seamless version control workflow
- **TMux Integration**: Smooth interaction with terminal multiplexer

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

- `<leader>t` - Run current test
- `<leader>tf` - Run tests in current file
- `<leader>xx` - Toggle diagnostics in Trouble
- `<leader>cs` - Toggle symbols in Trouble
- `<leader>F` - Format current buffer

Check the `lua/macnolo/keymaps.lua` file for a complete list of key mappings.

## Structure

- `init.lua` - Entry point
- `lua/macnolo/init.lua` - Main configuration
- `lua/macnolo/options.lua` - Neovim options
- `lua/macnolo/keymaps.lua` - Key mappings
- `lua/macnolo/lazy.lua` - Plugin manager setup
- `lua/macnolo/plugins/` - Plugin-specific configurations

## Customization

To customize this configuration:

1. Modify options in `lua/macnolo/options.lua`
2. Adjust key mappings in `lua/macnolo/keymaps.lua`
3. Add or remove plugins by editing files in the `lua/macnolo/plugins/` directory

## Credits

- All plugin authors for their amazing work
- Neovim team for creating such an extensible editor