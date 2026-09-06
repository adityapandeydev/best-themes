# Best Themes — VS Code Extension

This directory contains the VS Code theme extension package for **Best Themes**.

All bundled themes are contributed through a single extension, allowing users to install the entire curated collection at once.

---

## 📁 Directory Structure

```text
vscode/
├── themes/            # Individual VS Code theme JSON files
├── package.json       # Extension manifest (contributes.themes)
├── LICENSE            # Extension license
└── README.md          # VS Code extension documentation
```

---

## 🛠️ Local Development & Packaging

### Prerequisites
- Node.js (v18+)
- npm

### 1. Install Dependencies
From the `vscode/` directory:
```bash
cd vscode
npm install
npm install --save-dev @vscode/vsce
```

### 2. Package the Extension Locally (.vsix)
To compile and package the extension without publishing:
```bash
npx vsce package --no-dependencies
```
This produces a file named `best-themes-<version>.vsix`.

### 3. Install the VSIX in VS Code
```bash
code --install-extension best-themes-<version>.vsix
```
Or inside VS Code:
1. Open the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X`).
2. Click the `...` (More Actions) menu in the top-right of the Extensions panel.
3. Select **Install from VSIX...**.
4. Choose the generated `.vsix` file.

---

## 🎨 Adding a Theme to the Extension

1. Place the theme JSON file in `vscode/themes/<theme-id>.json`.
2. Register the theme in `vscode/package.json` under `contributes.themes`:
   ```json
   {
     "label": "Best Themes — <Theme Display Name>",
     "uiTheme": "vs-dark",
     "path": "./themes/<theme-id>.json"
   }
   ```
3. Ensure both workbench colors (`colors`) and token syntax colors (`tokenColors`) adhere to canonical semantic tokens.
4. Repackage the extension using `npx vsce package`.

---

## 🚀 Marketplace Publishing Considerations

- Ensure `publisher`, `repository`, and `icon` fields are properly defined in `package.json`.
- A Personal Access Token (PAT) from Azure DevOps with Marketplaces (Manage) permissions is required for `npx vsce publish`.
- Automatic publishing is strictly disabled; manual validation precedes any release.
