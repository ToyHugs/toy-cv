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

