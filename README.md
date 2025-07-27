<h1 align="center">
  Toy CV
</h1>
<p align="center">
  ✨ A Typst template for writing beautiful CVs and cover letters
</p>

---

## Examples

| Cover Letter                                                   | CV                                         |
| -------------------------------------------------------------- | ------------------------------------------ |
| ![Cover Letter Example](./templates/previews/cover-letter.png) | ![CV Example](./templates/previews/cv.png) |

---

## Installation

### Dependency

- This template requires [Typst](https://typst.app). You can use the webapp or install it locally. Their GitHub repository is [here](https://github.com/typst/typst).
- Depending on how package works in your Typst installation, you may need to install the following fonts:
  - [Inter](https://rsms.me/inter/)
  - [Font Awesome 6](https://fontawesome.com/)
  - It will be detailed below how to install them based on your Typst installation.

### Webapp

1. Go to the package page on the Typst webapp: [Toy CV](https://typst.app/universe/package/brilliant-cv).
2. Click on "Create project in app"
3. This will create a new project with the template installed.

On the webapp, `Inter` is already installed, but you may need to install `Font Awesome` manually. Just download [Font Awesome 6 Free](https://fontawesome.com/download) and upload the `otfs` folder to your assets.

### Local Installation with Typst CLI

1. Create a new Typst project :
   ```bash
   typst init @preview/toy-cv:<version>
   ```
2. Replace `<version>` with the version you want to use, e.g., `0.1.0`.
3. This will create a new project with the template installed.
4. If you don't have the fonts installed, you can download them :
   - [Inter](https://rsms.me/inter/) and install it in your system.
   - [Font Awesome 6 Free](https://fontawesome.com/download) and extract the `otfs` folder to your project assets.

---

## Usage

### Cover Letter

To create a cover letter, you can use the `cover-letter.with` function. Here is an example:

```typst
#show: cover-letter.with(
  recipient-name: "John Doe",
  recipient-description: "Hiring Manager",
  sender-name: "Jane Smith",
  sender-description: "123 Main St, Springfield, USA",
  i18n: "en",
  subject: "Application for Software Engineer Position",
  prompt-injection: true,
  keywords-injection: ("software", "engineer", "developer"),
  signature: image("assets/signature.png"),
)

Your cover letter content goes here.
```

None of the parameters are required, but you can use them to customize your cover letter. Here is a list of available parameters:

```typst

```

| Keyword                 | Description                                                                                                                        | Default |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `recipient-name`        | Name of the recipient                                                                                                              | none    |
| `recipient-description` | Description of the recipient. You can use content to format it or add multiple lines.                                              | none    |
| `sender-name`           | Name of the sender. Your name.                                                                                                     | none    |
| `sender-description`    | Description of the sender. You can use content to format it or add multiple lines.                                                 | none    |
| `i18n`                  | Language for the cover letter. It will use the i18n system to translate the content.                                               | "en"    |
| `subject`               | Subject of the cover letter. It will be used in the header.                                                                        | none    |
| `prompt-injection`      | If true, it will inject an invisible prompt in the cover letter to manipulate AI models. The prompts can be found in `i18n` files. | false   |
| `keywords-injection`    | It will inject invisible keywords in the cover letter, depending on your inputs. Ex : `("software", "engineer", "developer")`      | none    |
| `signature`             | Signature image to use in the cover letter. It will be displayed at the bottom of the letter.                                      | none    |

### CV

### About i18n

### About Prompt Injection

---

## Licenses

This project is licensed under the [MIT License](https://opensource.org/license/mit).

It uses the [Inter](https://rsms.me/inter/) font, which is licensed under the [OFL-1.1](https://openfontlicense.org/).

It also uses icons from [Font Awesome](https://fontawesome.com/license/free), which are licensed under the [SIL OFL 1.1](https://fontawesome.com/license/free).

### Image Licenses

- `avatar.png` : © 2025 Georges — Licence [CC BY SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
- `signature.png` : Public domain ([CC0](https://creativecommons.org/publicdomain/zero/1.0/))

---

## Acknowledgements

- [**Typst**](https://typst.app) is a modern typesetting system that makes it easy to create beautiful documents.
- [**brilliant-CV**](https://github.com/yunanwg/brilliant-CV) is the architecture inspiration for this template (prompt injection, i18n, cv with module system, toml, etc...). Thanks to [Yunan](https://github.com/yunanwg) for the amazing work!
- [**Inter**](https://rsms.me/inter/) is a free and open-source typeface designed for computer screens, created by [Rasmus Andersson](https://rsms.me/).
- [**Font Awesome**](https://fontawesome.com/) is a font and icon toolkit for displaying icons.
- Thanks to Georges for the avatar image used in the CV example.
