// CV and Cover Letter Template in Typst

// Author: Pierre GUYOT (@toyhugs - pierre.guyot@toyhugs.fr)
// Date: 2025-07-20
// License: MIT License

#import "utils.typ" as utils

// Cover Letter Template
// Usage:
// #show : cover-letter.with(
//   arguments...
// )
#let cover-letter(
  recipient-name: none, // Name of the recipient
  recipient-description: none, // Recipient's title or position
  sender-name: none, // Your full name
  sender-description: none, // Your description (address, contact info)
  i18n: "en", // Language
  signature: none, // Signature image or text
  main-color: rgb("#E40019"), // Main color for the letter
  subject: none, // Subject line of the letter
  prompt-injection: false, // Optional prompt injection, for AI systems
  keywords-injection: none, // Optional list of keywords to inject for AI systems
  body, // Main content of the letter
) = {
  // ==========================================================================
  //                                 Page Setup
  // ==========================================================================

  set page(margin: 2cm)
  set text(lang: i18n, size: 11pt, font: "Inter")

  // ==========================================================================
  //                                  AI Injection
  // ==========================================================================

  utils.prompt-injection-function(prompt-injection, keywords-injection, i18n)

  // ==========================================================================
  //                                 Header
  // ==========================================================================

  utils.recipient-line(sender-name, main-color)
  sender-description

  {
    set align(right)
    utils.recipient-line(recipient-name, main-color)
    recipient-description
  }

  v(1em)
  {
    set text(weight: 700)
    utils.translate("subject", i18n)
    [ ]
    subject
  }

  // ==========================================================================
  //                                  Body
  // ==========================================================================

  {
    set par(justify: true, first-line-indent: 2em, spacing: 1.5em)
    body
  }

  // ==========================================================================
  //                                 Signature
  // ==========================================================================

  if signature != none {
    set align(right)
    set text(size: 1.3em, weight: 700)
    set par(spacing: 0.5em)

    sender-name
    context {
      let size = measure(sender-name)
      image(signature, width: size.width)
    }
  }
}


