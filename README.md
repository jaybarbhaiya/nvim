# AstroNvim Template

**NOTE:** This is for AstroNvim v5+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## Language Support

### SAP CAP CDS

#### LSP

Install the CDS language server globally via npm:

```shell
npm i -g @sap/cds-lsp
```

The LSP is configured in `lua/plugins/cds.lua` and will be picked up automatically on next startup.

#### Treesitter

The CDS parser is registered as a custom parser in `lua/plugins/cds.lua`. Install it from inside Neovim:

```
:TSInstall cds
```

The highlight queries are pre-copied into `queries/cds/` in this repository and will be loaded automatically. If you ever need to refresh them (e.g. after a `tree-sitter-cds` upstream update), re-fetch them with:

```shell
for f in highlights injections locals tags; do
  curl -fsSL "https://raw.githubusercontent.com/cap-js-community/tree-sitter-cds/main/queries/${f}.scm" \
    -o ~/.config/nvim/queries/cds/${f}.scm
done
```
