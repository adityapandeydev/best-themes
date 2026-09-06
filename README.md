# Best Themes

A unified, cross-editor theme collection and semantic consistency system for **VS Code**, **Zed**, and **Neovim**.

---

## 🌟 The Vision

Developers often work across multiple editors—VS Code for full-stack web work, Zed for blazing-fast lightweight editing, and Neovim for modal terminal mastery. However, maintaining a coherent visual aesthetic across these tools is frustrating:

1. **Fragmentation:** You have to hunt down, install, and configure disparate theme packages across three separate package ecosystems.
2. **Visual Inconsistency:** The "same" theme (e.g., Catppuccin Mocha or Tokyo Night) often looks completely different across editors due to diverging syntax engines, token scopes, and arbitrary color decisions made by different maintainers.
3. **Inflexibility:** It is difficult to balance keeping certain themes pristine (upstream), tweaking others to personal taste (modified), and building bespoke themes from scratch (custom).

**Best Themes** solves this by acting as both:
1. **A Curated Multi-Theme Bundle:** A single installation source per editor containing an entire curated library of themes.
2. **A Cross-Editor Visual Uniformity System:** A semantic design token architecture ensuring that equivalent code constructs look visually consistent across VS Code, Zed, and Neovim.

---

## 🏗️ Repository Architecture

The architecture separates the **conceptual source of truth** (canonical theme definitions and palettes) from the **editor-specific implementations**:

```text
best-themes/
├── themes/                     # Canonical theme layer (Source of Truth)
│   ├── upstream/               # Unmodified upstream themes (preserved as-is)
│   ├── modified/               # Upstream-derived themes with deliberate tweaks
│   └── custom/                 # Original custom themes designed from scratch
│
├── vscode/                     # VS Code theme extension package
│   ├── themes/                 # Generated/packaged VS Code theme JSON files
│   ├── package.json            # Extension manifest exposing all themes
│   ├── LICENSE
│   └── README.md
│
├── zed/                        # Zed theme extension package
│   ├── themes/
│   │   └── best-themes.json    # Multi-theme JSON schema file
│   ├── extension.toml          # Zed extension manifest
│   ├── LICENSE
│   └── README.md
│
├── neovim/                     # Neovim colorscheme plugin
│   ├── colors/                 # Colorscheme entry points (e.g., best-dark.lua)
│   ├── lua/
│   │   └── best-themes/        # Core Lua theme modules and palettes
│   ├── plugin/                 # Plugin runtime commands / autocommands
│   ├── LICENSE
│   └── README.md
│
├── tests/
│   └── syntax-samples/         # Representative multi-language code corpus
│
├── licenses/
│   └── THIRD-PARTY-NOTICES.md  # Comprehensive third-party license log
│
├── .gitignore
├── LICENSE
└── README.md
```

### Architectural Principle

```text
themes/
  ├── upstream/   ──> (Preserved independent definitions)
  ├── modified/   ──┐
  └── custom/     ──┴─> Canonical Semantic Palette (Tokens)
                             │
            ┌────────────────┼────────────────┐
            ▼                ▼                ▼
         vscode/            zed/           neovim/
     (TextMate +          (Syntax         (Tree-sitter +
   Semantic Tokens)       Styles)           Highlight)
```

---

## 🎨 Theme Categories

Every theme in this repository belongs to one of three clear categories:

### 1. Upstream Themes (`themes/upstream/<theme-name>/`)
* Themes imported directly from the open-source community that are preserved **exactly as-is**.
* Visual definitions and upstream editor-specific files are kept intact.
* Full attribution and upstream licensing notices are strictly maintained in `licenses/THIRD-PARTY-NOTICES.md`.

### 2. Modified Themes (`themes/modified/<theme-name>/`)
* Themes based on community favorites, but adapted or normalized to adhere to our cross-editor semantic standard or personal aesthetic preferences.
* Documented with:
  * Upstream project and repository URL
  * Original license
  * Detailed diff of modifications (visual vs. structural) and rationale
* Explicitly branded (e.g., `Best Themes — Catppuccin Mocha Custom`) so upstream work is never misrepresented.

### 3. Custom Themes (`themes/custom/<theme-name>/`)
* Completely bespoke themes designed from the ground up (e.g., `Best Dark`, `Best Light`).
* Governed directly by canonical semantic token palettes created for this project.

---

## 🔮 Cross-Editor Visual Uniformity Philosophy

Different editors employ fundamentally different syntax highlighting engines:
* **VS Code:** TextMate regex grammars + LSP Semantic Tokens (`storage.modifier`, `keyword.control`, etc.)
* **Zed:** Tree-sitter query captures mapped through Zed's syntax style system (`keyword`, `type`, `function`, etc.)
* **Neovim:** Native Tree-sitter highlights + Vim syntax groups (`@keyword`, `@function.method`, `Normal`, etc.)

Attempting to force all editors into an identical JSON schema is impossible and counterproductive. Instead, **Best Themes targets semantic and perceptual equivalence**:

> **The same semantic programming construct must receive the same intended color across all three editors.**

### Canonical Semantic Design Tokens

For normalized and custom themes, colors are assigned to semantic roles, not arbitrary editor scope names:

```text
[UI & Chrome]
  background            Editor and window surface
  foreground            Default text / unstyled identifiers
  surface               Sidebars, panels, floating popups
  border                Dividers and structural borders
  selection             Selected text highlights
  cursor                Caret indicator

[Syntax Semantics]
  comment               Documentation and inline comments
  keyword               Control flow (if, else, for, return)
  modifier              Access/storage modifiers (pub, private, static, final)
  operator              Math, comparison, and assignment operators
  string                String literals and character literals
  number                Numeric literals (integers, floats, hex)
  boolean               Boolean literals (true, false)
  constant              Constants, immutable values, enum variants
  function              Function definitions and calls
  method                Method definitions and calls
  type                  Type declarations, primitives, aliases
  class                 Class names and struct identifiers
  interface             Trait and interface definitions
  variable              Local variables and bindings
  parameter             Function and method parameters
  property              Object/struct fields and attributes

[Diagnostics]
  error                 Errors and fatal diagnostics
  warning               Warnings
  info                  Informational messages
  hint                  Inlay hints and suggestions
```

### Cross-Editor Mapping Example

| Semantic Token | Canonical Color | VS Code Scope | Zed Style | Neovim Group |
| :--- | :--- | :--- | :--- | :--- |
| **keyword** | `#cba6f7` | `keyword.control` | `keyword` | `@keyword` |
| **modifier** | `#cba6f7` | `storage.modifier` | `keyword` | `@keyword.modifier` / `@type.qualifier` |
| **function** | `#89b4fa` | `entity.name.function` | `function` | `@function` |
| **string** | `#a6e3a1` | `string.quoted` | `string` | `@string` |
| **type** | `#f9e2af` | `entity.name.type` | `type` | `@type` |

---

## 📦 Multi-Theme Distribution Summary

Each editor extension distributes **all bundled themes through a single package**:

| Editor | Package Type | Distribution / Local Installation | Exposed Themes |
| :--- | :--- | :--- | :--- |
| **VS Code** | Extension (`.vsix`) | `code --install-extension best-themes-*.vsix` | Contributed via single `package.json` |
| **Zed** | Zed Theme Extension | Installed via local dev extension directory | Contributed via single `best-themes.json` |
| **Neovim** | Lua Plugin | Installed via `lazy.nvim` or native packpath | Switched via `:colorscheme <name>` |

---

## 🚀 Workflows: Adding & Maintaining Themes

### Adding an Upstream Theme
1. Place upstream reference files in `themes/upstream/<theme-name>/`.
2. Verify that the upstream license permits bundling and redistribution.
3. Add full attribution and license details to `licenses/THIRD-PARTY-NOTICES.md`.
4. Add the theme definitions to `vscode/themes/`, `zed/themes/best-themes.json`, and `neovim/colors/`.
5. Register the theme in each editor manifest.

### Adding a Modified Theme
1. Create `themes/modified/<theme-name>/README.md` noting upstream origin, diffs, and rationale.
2. Define the canonical palette and semantic tokens.
3. Map the palette into each editor format (`vscode/`, `zed/`, `neovim/`).
4. Prefix theme names with `Best Themes — ` to prevent collision and preserve transparency.
5. Update `licenses/THIRD-PARTY-NOTICES.md`.

### Adding a Custom Theme
1. Create `themes/custom/<theme-name>/` with palette definitions.
2. Define the unified semantic color mappings.
3. Implement the theme in `vscode/themes/`, `zed/themes/best-themes.json`, and `neovim/colors/`.
4. Verify cross-editor consistency against `tests/syntax-samples/`.

---

## 🧪 Testing Consistency: Syntax Samples

The `tests/syntax-samples/` directory holds multi-language test files (Rust, TypeScript, Python, Go, C++, etc.) containing representative language constructs.

Open these files side-by-side in VS Code, Zed, and Neovim to visually audit semantic parity across languages and editors.

---

## 📄 Licensing & Attribution

- The orchestration code, custom theme palettes, and tooling are licensed under the [MIT License](file:///e:/Aditya/Projects/best-themes/LICENSE).
- All third-party themes, modifications, and community designs retain their respective copyrights.
- Consult [THIRD-PARTY-NOTICES.md](file:///e:/Aditya/Projects/best-themes/licenses/THIRD-PARTY-NOTICES.md) for full attribution logs.
