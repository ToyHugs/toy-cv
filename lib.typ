#let recipient-line(body) = {
  set text(size: 1.7em, weight: 700)
  set par(spacing: 0.5em)
  body
  context {
    let size = measure(body)
    line(stroke: 2pt + rgb("#E40019"), length: size.width)
  }
}

#let cover-letter(
  recipient-name,             // Name of the recipient
  recipient-description,      // Recipient's title or position
  sender-name,                // Your full name
  sender-description          // Your address
  city,                       // City where
  i18n: "en"                  // Language
  date: datetime().today(),   // Date of the letter
  subject,                    // Subject line of the letter
) = {
  
}

#let signature(
  body
  image
) = {
  
}