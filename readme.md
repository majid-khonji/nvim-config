# NeoVim Configuration

A sleek and powerful Neovim setup focused on productivity with fuzzy search, Git tools, Markdown/Obsidian integration and AI assistance.

For a more comprehensive experience, use the Fish shell with the following plugins:
- [Terminal Secretary](https://github.com/majid-khonji/terminal-secretary) for inline terminal GPT invocation (supports reading from the primary selection clipboard for fast Q&A).
- [Johnny Decimal Navigator](https://github.com/majid-khonji/johnny-decimal-navigator) for efficient folder navigation following the [Johnny Decimal](https://johnnydecimal.com/) convention.

## Features

- 🎨 Gruvbox theme with custom styling
- 🔍 Fuzzy file and text search with Telescope
- 📁 File navigation with NvimTree
- 🏃 Quick buffer navigation with Harpoon
- 💻 LSP integration for code intelligence
- 🤖 GitHub Copilot Chat integration
- 🐛 Debugging tools with DAP
- 🔀 Git integration with Neogit
- 📊 Function overview with Aerial
- 💅 Sleek status line with Lualine
- 📝 Obsidian vault integration for notes and knowledge management

## Installation

### Prerequisites

- Neovim >= 0.8.0
- [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- [Ripgrep](https://github.com/BurntSushi/ripgrep) for search functionality

### Setup

1. Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/majid-khonji/nvim-config ~/.config/nvim
```

2. Install vim-plug if you don't have it already:

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

3. Open Neovim and install plugins:

```
:PlugInstall
```

4. Restart Neovim to apply changes

## Key Mappings

- `;` is the leader key

### Navigation & Search
- `<leader>o` - Find files with Telescope
- `<leader>O` - Search text with live grep
- `<C-j>` - Jump forward in jump list 
- `<C-k>` - Jump backward in jump list
- `<C-u>/<C-d>` - Scroll up/down with centering

### Productivity
- `<leader>m` - Add file to Harpoon
- `<leader>h` - Toggle Harpoon menu
- `<leader>1-5` - Jump to Harpoon marked files
- `<leader>d` - Toggle file explorer
- `<leader>c` - Toggle Copilot Chat
- `<leader>f` - Toggle function overview (Aerial)
- `<C-h>` - Toggle Avante AI cursor
- `<C-_>` - Toggle comments (normal/visual mode)
- `<C-t>` - Toggle floating terminal

### LSP & Coding
- `gd` - Go to definition
- `gt` - Type definition
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show hover documentation
- `<leader>a` - Code action
- `<leader>r` - Rename symbol
- `<c-f>` - Format code
- `<leader>v` - Show diagnostics
- `[d]/]d` - Navigate diagnostics

### Debugging
- `<leader>g` - Toggle debug UI
- `<F5>` - Continue execution
- `<F10>/<F11>/<F12>` - Step over/into/out
- `<leader>b` - Toggle breakpoint

### Clipboard
- `<leader>y` - Copy to system clipboard
- `<leader>p` - Paste from system clipboard

## Quick Start

1. Navigate files: `;o` to find files, `;O` to grep content
2. Mark important files: `;m` adds current file to Harpoon
3. Jump between marked files: `;1`, `;2`, `;3`, etc.
4. View file structure: `;f` to show functions/classes
5. Get AI assistance: `;c` to open Copilot Chat
6. Debug your code: `;g` to toggle debug UI

## Customization

Edit `~/.config/nvim/init.vim` to customize your configuration. The setup uses standard Vim/Neovim conventions for configuration.

For plugin-specific settings, refer to each plugin's documentation linked in the comments of `init.vim`.
