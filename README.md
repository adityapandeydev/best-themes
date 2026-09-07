# Best Themes

A curated, cross-editor theme collection and semantic consistency system for **VS Code**, **Zed**, and **Neovim**.

---

## 🌟 The Vision

Software engineers frequently move between multiple editors—VS Code for rich extension ecosystems and full-stack development, Zed for high-performance editing, and Neovim for modal terminal workflows. However, maintaining visual and cognitive consistency across these environments is challenging:

1. **Ecosystem Fragmentation:** Developers are forced to locate, configure, and maintain separate theme packages across different package registries.
2. **Syntax Inconsistencies:** The "same" theme (such as Tokyo Night or Catppuccin) renders inconsistently across editors because underlying syntax engines, grammar parsers, and token scopes diverge significantly.
3. **Arbitrary Color Assignment:** In many community themes, identical semantic concepts (such as access modifiers, type declarations, or constants) receive inconsistent colors depending on the language.

**Best Themes** addresses these issues through:
1. **A Unified Multi-Theme Collection:** A single installation per editor providing access to a curated set of enhanced themes.
2. **A Semantic Design Token Architecture:** A disciplined syntax mapping standard that ensures programming constructs receive deliberate, coherent styling across supported languages.

---

## 🎨 Included Themes

### 1. Best Theme - Tokyo Night Enhanced
This theme is based on **Tokyo Night Dark Enhanced**, where I made some modifications to syntax highlighting, modifiers, and tokens that feel the best to me.

### 2. Best Theme - Catppuccin Mocha Enhanced
This theme is based on **Catppuccin Mocha**, adapted with color adjustments that feel the best to me while preserving the core design. This same philosophy will be followed for all other themes added to this collection.

---

## 🏗️ Repository Architecture

The repository separates canonical theme definitions from editor-specific distribution packages:

```text
best-themes/
├── themes/                     # Canonical theme source of truth
│   ├── upstream/               # Preserved reference themes
│   ├── modified/               # Modified & enhanced theme definitions
│   └── custom/                 # Original bespoke theme designs
│
├── vscode/                     # VS Code theme extension package
│   ├── themes/                 # Packaged theme JSON files
│   ├── package.json            # Extension manifest (contributes.themes)
│   ├── LICENSE
│   └── README.md
│
├── zed/                        # Zed theme extension package
│   ├── themes/
│   │   └── best-themes.json    # Multi-theme JSON definition
│   ├── extension.toml          # Zed extension manifest
│   ├── LICENSE
│   └── README.md
│
├── neovim/                     # Neovim colorscheme plugin
│   ├── colors/                 # Colorscheme entry points
│   ├── lua/best-themes/        # Core Lua highlight modules and palettes
│   ├── LICENSE
│   └── README.md
│
├── tests/
│   └── syntax-samples/         # Cross-language visual audit test files
│
├── licenses/
│   └── THIRD-PARTY-NOTICES.md  # Upstream license notices and attribution
│
├── LICENSE
└── README.md
```

---

## 🔬 Cross-Editor Parity & Engine Reality

Achieving visual parity requires understanding how each editor processes syntax:

### 1. VS Code (Production Ready)
- **Engine:** Oniguruma TextMate regex grammars combined with Language Server Protocol (LSP) Semantic Highlighting.
- **Parity Status:** Full 1-to-1 semantic parity. TextMate rules handle instantaneous static token coloring, while granular semantic tokens (`variable.readonly`, `enumMember`, `modifier`, etc.) refine highlights dynamically when language servers index the workspace.

### 2. Zed (Architectural Constraints)
- **Engine:** Tree-sitter query captures mapped through Zed's internal `syntax` style schema.
- **Parity Status:** Adapted for maximum harmony within Zed's constraints. Zed's theme schema maps broader syntax buckets (e.g. `keyword`, `type`, `function`, `property`) and does not currently support arbitrary TextMate regex scopes or fine-grained runtime semantic modifiers (such as differentiating `final` constants from mutable bindings without query overrides). While exact 1-to-1 parity with VS Code is prevented by these architectural differences, I have tuned the Zed themes to achieve the closest possible aesthetic and structural alignment.

### 3. Neovim (In Progress)
- **Engine:** Native Tree-sitter captures (`@keyword`, `@type`, `@function`, etc.) and LSP semantic token highlights (`@lsp.type.*`).
- **Parity Status:** Under active development. While baseline highlights and palette structures have been defined, full cross-language visual verification is still in progress.

---

## 🧪 Visual Audit Suite

The `tests/syntax-samples/` directory provides standardized multi-language test files across Rust, Java, C, C++, Go, Python, and JSON:
- `rust.rs` — Control flow, struct definitions, impl blocks, lifetimes, macros, and traits.
- `java.java` — Class structure, access modifiers, static final constants, enums, records, and loops.
- `c.c` — Preprocessor macros, typedef enums, structs, pointers, and conditionals.
- `cpp.cpp` — Namespaces, constexpr values, modern loops, references, and enum classes.
- `python.py` — Type hints, decorators, dataclasses, control flow, and constant bindings.
- `go.go` — Package declarations, interfaces, structs, goroutines, and error handling.
- `json.json` — Keys, values, arrays, numbers, and boolean literals.

---

## 📄 License & Attribution

- The orchestration codebase, tooling, and custom palettes are licensed under the [MIT License](file:///e:/Aditya/Projects/best-themes/LICENSE).
- Upstream community themes and derivative adaptations retain their respective licenses and copyrights. Detailed attribution is maintained in [THIRD-PARTY-NOTICES.md](file:///e:/Aditya/Projects/best-themes/licenses/THIRD-PARTY-NOTICES.md).
