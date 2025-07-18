// Utility Functions in Typst

// Author: Pierre GUYOT (@toyhugs - pierre.guyot@toyhugs.fr)
// Date: 2025-07-18
// License: MIT License

// Utility function to create a underline for recipient names
#let recipient-line(body, color) = {
  set text(size: 1.7em, weight: 700)
  set par(spacing: 0.5em)
  body
  context {
    let size = measure(body)
    line(stroke: 2pt + color, length: size.width)
  }
}

// Function to translate text based on the provided language
#let translate(key, lang) = {
  let dict = toml("i18n/" + lang + ".toml")
  let translate-value = dict.lang.at(key, default: none)
  
  if translate-value != none {
    return translate-value
  }
  panic("Translation key '" + key + "' not found in language '" + lang + "'.")
}

// Function to handle prompt injection for AI systems
// From brilliant-CV @yunanwg : https://github.com/yunanwg/brilliant-CV
#let prompt-injection-function(prompt-injection, keywords-injection, i18n) = {
  let prompt-ai = ""

  if prompt-injection {
    prompt-ai = translate("prompt-injection", i18n)
  }

  if keywords-injection != none {
    prompt-ai = prompt-ai + " " + keywords-injection.join(" ")
  }

  place(text(prompt-ai, size: 1pt, fill: white), dx: 0pt, dy: 0pt)
}