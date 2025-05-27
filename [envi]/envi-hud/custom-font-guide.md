ofc # Custom Fonts Setup Documentation

This document explains how to add custom fonts to your project and how to use them. You can either use fonts from [Google Fonts](https://fonts.google.com/) or include your own custom font files.

---

## Using Google Fonts

When using fonts from Google Fonts, there are two methods available:

### Method 1: Using `@import` in Your CSS

1. **Select Your Font:**
   - Go to [Google Fonts](https://fonts.google.com/) and search for the desired font.
   - Click on the font to view its details.

   <img src="https://i.imgur.com/G0qW897.png">

2. **Obtain the `@import` Code:**
   - Click the **"Get font"** button.
   - Click **"Get embed code"**.
   - Choose the **`@import`** option.
   - Click **"Copy code"** to copy the code snippet.
   - **Note:** Only copy the code inside the `<style>...</style>` tags. Remove the `<style>` tags before using the code.
  
    <img src="https://i.imgur.com/J2hophS.png">
    <img src="https://i.imgur.com/ynLsEip.png">
    <img src="https://i.imgur.com/HzPxHkQ.png">

3. **Add the Code to Your CSS:**
   - Open your project's CSS file (e.g., `style-...css`).
   - Paste the `@import` code below any existing `@import` statements.

    <img src="https://i.imgur.com/Qrlh4PO.png">
   

4. **Configure the Font:**
   - Open the configuration file located at `web/build/config/hud/styles/base.js`.
   - Add the new font details according to the instructions provided in that file.

---

### Method 2: Using `<link>` in Your HTML

1. **Select Your Font:**
   - Navigate to [Google Fonts](https://fonts.google.com/) and choose the font you want to use.
   - Click on the font to access its details.

2. **Obtain the `<link>` Code:**
   - Click the **"Get font"** button.
   - Click **"Get embed code"**.
   - Choose the **`<link>`** option.
   - Copy the provided `<link>` snippet.

   <img src="https://i.imgur.com/lb3XHCk.png">

3. **Add the Code to Your HTML:**
   - Open your main HTML file (e.g., `index.html`).
   - Paste the `<link>` code above the `<title>` tag (for example, above `<title>Vite + React + TS</title>`).

   <img src="https://i.imgur.com/42hg7p6.png">

4. **Configure the Font:**
   - As in Method 1, update the configuration file at `web/build/config/hud/styles/base.js` with the new font details.

---

## Using Custom Fonts (Non-Google Fonts)

If you are not using fonts from Google Fonts and have your own font files (such as `.ttf`, `.otf`, etc.), follow these steps:

1. **Add Font Files:**
   - Place your custom font files into a folder named `fonts` within your project.

   <img src="https://i.imgur.com/iG08BRt.png">

2. **Define the Font with `@font-face`:**
   - Open your project's CSS file (e.g., `style-...css`).
   - Locate the existing `@font-face` code snippet provided by the UI as a template.
   - Copy and modify this code to reference your custom font files.
   - **Note:** Ensure that the font name and file format are exactly correct.

3. **Configure the Font:**
   - After updating your CSS with the new `@font-face` definitions, open the configuration file at `web/build/config/hud/styles/base.js`.
   - Add the new font details to integrate it fully into the UI.

---

## Summary

- **Google Fonts:**
  - **Method 1:** Use the `@import` option in your CSS.
  - **Method 2:** Use the `<link>` option in your HTML.
- **Custom Fonts (Non-Google Fonts):**
  - Place your font files in the `fonts` folder.
  - Define the font using `@font-face` in your CSS.
- **Final Step for All Methods:**
  - Update the configuration file at `web/build/config/hud/styles/base.js` to include the new font.

By following these instructions, you can easily add and use custom fonts in your project.
