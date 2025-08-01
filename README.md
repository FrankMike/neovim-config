# Neovim Lua Configuration

A Lua-based Neovim configuration with LSP support and completion.

## Installation

```bash
cd ~/.config
git clone https://github.com/FrankMike/neovim-config.git nvim
```

Open Neovim and plugins will be automatically installed via lazy.nvim on first startup.

## Features

- **Modern Lua Configuration**: Native Neovim Lua APIs throughout
- **Plugin Management**: lazy.nvim with lazy loading and performance optimization
- **LSP Support**: Multiple language servers with modern configuration
- **Completion**: nvim-cmp with multiple sources and snippet support
- **File Explorer**: nvim-tree with git integration
- **Fuzzy Search**: fzf with proximity-sort integration
- **Git Integration**: fugitive and neogit
- **Colorscheme**: Edge theme with terminal colors

## Configuration Structure

```
init.lua                    # Main entry point
lua/
├── config/
│   ├── options.lua        # General Neovim options
│   ├── keymaps.lua        # Key mappings
│   ├── autocmds.lua       # Autocommands
│   └── lazy.lua           # Plugin manager setup
├── plugins/
│   ├── init.lua           # Core plugins
│   ├── ui.lua             # UI components (lualine, nvim-tree)
│   ├── lsp.lua            # Language servers
│   ├── completion.lua     # Completion system
│   ├── search.lua         # Search and navigation
│   ├── git.lua            # Git integration
│   └── misc.lua           # Miscellaneous plugins
└── utils/
    ├── helpers.lua        # Utility functions
    └── validation.lua     # Configuration validation
```

## Language Support

The configuration includes LSP support for:

- **Rust**: rust-analyzer with rust-tools.nvim
- **Python**: pylsp (Python LSP Server)
- **Lua**: lua_ls with Neovim-specific configuration
- **JavaScript/TypeScript**: Ready for tsserver setup
- **HTML**: html language server
- **CSS**: cssls
- **SQL**: sqlls
- **C++**: clangd
- **Java**: jdtls (Eclipse JDT Language Server)
- **Kotlin**: kotlin_language_server

## Dependencies

### Required Tools

#### Rust Development
```bash
# Install rustup and rust-analyzer
rustup component add rustfmt
# Install rust-analyzer: download binary from https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
```

#### Search and Navigation
```bash
# Install fzf and fd for fuzzy search
# On Arch Linux:
pacman -S fzf fd

# On macOS:
brew install fzf fd

# Install proximity-sort for file ordering
cargo install proximity-sort
```

#### Language Servers
Most language servers can be installed via your system package manager or language-specific tools:

```bash
# Python
pip install python-lsp-server

# Node.js based servers
npm install -g vscode-langservers-extracted  # for html, css, json
npm install -g sql-language-server

# C++
# Install clangd via your system package manager

# Java
# Install Eclipse JDT Language Server
# Download from: https://download.eclipse.org/jdtls/milestones/
# Or install via package manager (e.g., brew install jdtls on macOS)

# Kotlin
# Install Kotlin Language Server
# Download from: https://github.com/fwcd/kotlin-language-server/releases
# Or install via package manager
```

## Key Mappings

### General
- `<Space>` - Leader key
- `jk` - Exit insert mode
- `<C-p>` - Fuzzy file search
- `<Leader>f` - Toggle file explorer
- `,` - Find current file in tree
- `;` - Clear screen

### LSP
- `gd` - Go to definition
- `gr` - Show references
- `K` - Show hover information
- `ga` - Show code actions
- `g[` / `g]` - Navigate diagnostics

### Clipboard
- `<Leader>y` - Copy to system clipboard
- `<Leader>p` - Paste from system clipboard

### Rust Development Shortcuts
- `DD` - Insert `println!("`
- `DDD` - Insert `println!("{:#?}", `
- `DDDD` - Insert `#[derive(Debug,Clone)]`
- `WW` - Insert `.map_err(|_| ())?;`



## Setup Instructions

1. **Clone the configuration**:
   ```bash
   cd ~/.config
   git clone https://github.com/FrankMike/neovim-config.git nvim
   ```

2. **Install dependencies** (see Dependencies section above)

3. **Start Neovim**: Plugins will be automatically installed on first startup

4. **Validate configuration**: Run `:ValidateConfig` to ensure everything is working

## Validation

The configuration includes a built-in validation system. Run `:ValidateConfig` to check:
- All modules load correctly
- Key mappings are properly set
- Essential options are configured

## Customization

- **Add new plugins**: Create files in `lua/plugins/`
- **Modify key mappings**: Edit `lua/config/keymaps.lua`
- **Change options**: Edit `lua/config/options.lua`
- **Add language servers**: Edit `lua/plugins/lsp.lua`

## Troubleshooting

If you encounter issues:

1. Run `:ValidateConfig` to check for common problems
2. Check `:checkhealth` for Neovim health issues
3. Use `:Lazy` to manage plugins and check for errors
4. Check `:LspInfo` for language server status
