# SOCI-428

This repository contains course materials for SOCI-428. All work happens in a GitHub Codespace — no local R installation needed.

---

## Getting Started

### 1. Open the Codespace

Click the green **Code** button on the repository page → **Codespaces** tab → **Create codespace on main**.

The environment takes 3–5 minutes to build on first launch. Subsequent launches are fast.

When ready, RStudio opens automatically in your browser on port 8787.

### 2. Authorize GitHub Copilot (one time only)

Copilot provides inline code suggestions as you type. On first use:

1. In RStudio, go to **Tools → Global Options → Copilot**
2. Click **Sign In** and follow the browser prompt to authorize with your GitHub account
3. Students with a GitHub Education account get Copilot free

### 3. Working with Quarto

Exercises are `.qmd` files in the `exercises/` folder. To render:

- Click **Render** in the RStudio toolbar, or
- Run `quarto::quarto_render("your-file.qmd")` in the Console

Output defaults to HTML. You can change `format: html` in the YAML header to `format: pdf` if needed.

---

## Folder Structure

```
exercises/
  week01/   ← Week 1 exercise
  week02/   ← Week 2 exercise (added as course proceeds)
  ...
```

---

## Notes

- R packages beyond base R are not pre-installed. Install any you need with `install.packages()` — they persist for your Codespace session.
- Do not commit large data files to the repository.
