# Best Themes — Zed Extension

This directory contains the standalone Zed theme extension for **Best Themes**.

All bundled themes are contributed through a single Zed extension using Zed's multi-theme JSON specification.

---

## 📁 Directory Structure

```text
zed/
├── extension.toml         # Zed extension manifest
├── themes/
│   └── best-themes.json   # Multi-theme definition file
├── LICENSE                # Extension license
└── README.md              # Zed extension documentation
```

---

## 📐 Zed Multi-Theme Specification

Zed supports packaging multiple themes within a single JSON file under `themes/best-themes.json`:

```json
{
  "$schema": "https://zed.dev/schema/themes/v0.1.0.json",
  "themes": [
    {
      "name": "Best Themes — Best Dark",
      "appearance": "dark",
      "style": { ... }
    },
    {
      "name": "Best Themes — Best Light",
      "appearance": "light",
      "style": { ... }
    }
  ]
}
```

Each theme entry defines its appearance (`dark` or `light`), UI colors, and Tree-sitter syntax highlighting styles.

---

## 🛠️ Local Development & Testing

### Method 1: Zed Dev Extensions (Official Workflow)
1. Open Zed.
2. Open the command palette (`Ctrl+Shift+P` / `Cmd+Shift+P`).
3. Run `zed: extensions`.
4. Click **Install Dev Extension** and select the `zed/` folder from this repository.
5. Open Theme Selector (`Ctrl+K Ctrl+T` / `Cmd+K Cmd+T`) to switch themes.

### Method 2: Symlink / Local Extension Directory
Alternatively, link or copy the `zed` directory to your local Zed extensions folder:

- **Windows:** `%APPDATA%\Zed\extensions\installed\best-themes`
  *(e.g., `C:\Users\<User>\AppData\Roaming\Zed\extensions\installed\best-themes`)*
- **macOS:** `~/Library/Application Support/Zed/extensions/installed/best-themes`
- **Linux:** `~/.local/share/zed/extensions/installed/best-themes`

Reload Zed or execute `zed: reload extensions` from the command palette after editing `best-themes.json` to immediately preview changes.

---

## 🎨 Adding a Theme to Zed

1. Open `zed/themes/best-themes.json`.
2. Add a new theme object to the `"themes"` array.
3. Define the theme's semantic colors (syntax styles, UI highlights, and diagnostic colors).
4. Reload extensions in Zed to test.
