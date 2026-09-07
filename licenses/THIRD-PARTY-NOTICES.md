# Third-Party Notices & Attribution Log

This document maintains the official record of all third-party themes, color palettes, and assets incorporated, adapted, or bundled within the **Best Themes** project.

---

## Policy & Verification Checklist

Before incorporating any third-party theme into `themes/upstream/` or creating a derived variant in `themes/modified/`:

1. **Verify Redistribution Rights:** Ensure the upstream license (e.g., MIT, Apache 2.0, BSD) explicitly permits redistribution and derivative works.
2. **Preserve Notices:** Retain all original copyright notices, contributor credits, and licensing terms.
3. **Transparent Branding:** Never misrepresent third-party work as an original creation. Derived works must clearly note modifications and credit upstream authors.
4. **Log Entry:** Every external theme must have a corresponding entry in this log.

---

## Log Entries

## Tokyo Night Enhanced

- **Project:** Tokyo Night Enhanced (adapted from Tokyo Night Dark Enhanced)
- **Variant / Flavor:** Enhanced
- **Upstream Repository:** <https://github.com/Venage5603/Tokyo-Night-Dark-Enhanced>
- **Original Author(s):** Andrew X. Shah / Venage5603 (Kane on VS Code Marketplace)
- **License:** MIT License
- **Category:** Modified / Normalized
- **Modifications:**
  - Adopted as "Best Theme - Tokyo Night Enhanced" across VS Code, Zed, and Neovim.
  - Standardized control flow keywords (`for`, `if`, `else`, `return`, `break`, `continue`, `impl`, `in`) to Sky Blue (`#89ddff`).
  - Standardized visibility modifiers (`pub`), storage modifiers, and function keywords to Lavender Purple (`#bb9af7`).
  - Ported visual semantics to Zed syntax styles (`zed/themes/best-themes.json`) and Neovim Tree-sitter highlight groups (`neovim/lua/best-themes/`).
  - Added strict JSON validation and packaging compatibility for multi-editor distributions.
- **License Text:**
  ```text
  MIT License

  Copyright (c) 2022 Andrew X. Shah

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  ```

---

### Template for New Entries

```markdown
## [Theme Name]

- **Project:** <Upstream Project Name>
- **Variant / Flavor:** <e.g., Mocha / Dark>
- **Upstream Repository:** <https://github.com/org/repo>
- **Original Author(s):** <Author Name / Organization>
- **License:** <e.g., MIT License>
- **Category:** <Upstream (Unmodified) | Modified>
- **Modifications:**
  - [None (if Upstream)]
  - [List specific changes if Modified, e.g., semantic token harmonization, background lightness adjustment, etc.]
- **License Text:**
  ```text
  [Paste original copyright notice and license text here]
  ```
```
