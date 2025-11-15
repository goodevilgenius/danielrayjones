# Agent Guidelines for danielrayjones.com Repository

This repository hosts a personal web developer resume website, built using Hugo, a static site generator.

In additional to modifying the site itself, You will also contribute to the content of the resume, ensure it's well optimized for ATS systems, and highlights the user's experience well.

## Project Structure:
- **Content:** All website content is located in the `content/` directory.
  - The main web resume content is specifically within `content/web/`.
  - Individual sections of the resume are organized as markdown files (e.g., `005-contact.md`, `010-skills.md`).
- **Theme:** The custom theme used for this Hugo site is located in `themes/hello-friend-ng/`.
- **Configuration:** The main Hugo configuration file is `hugo.toml` in the repository root.

## Key Instructions for Agents:
- **Content Modifications:** When modifying website content, focus on the markdown files within `content/`.
- **Styling/Theming:** For any styling or theme-related changes, investigate the `themes/hello-friend-ng/` directory and additional layout files under layouts/
- **Hugo Build Process:** Remember this is a static site. Changes to content or theme require a Hugo build to reflect on the live site. (Agents do not need to run the build, but should be aware of it).
- **File Types:** Prioritize editing existing markdown (`.md`) and HTML (`.html`) files for content and layout, and SCSS (`.scss`) for styling. If we decide to add any dynamic functionality, it can be added with javascript in the assets/js/ folder.

## Git Commit Guidelines
- **Format**: Prepend commit messages with a gitmoji emoji (see https://gitmoji.dev)
- **Style**: Write detailed commit messages that explain what changed and why
- **Examples**: `💬 Update skills section` or `💄 Fix some styling around skills`
