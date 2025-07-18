#import "utils.typ" as utils

// Cover Letter Template
// Usage:
// #show : cover-letter.with(
//   arguments...
// )
#let cover-letter(
  recipient-name: none,             // Name of the recipient
  recipient-description: none,      // Recipient's title or position
  sender-name: none,                // Your full name
  sender-description: none,         // Your description (address, contact info)
  city: none,                       // City where
  i18n: "en",                       // Language
  date: datetime.today(),           // Date of the letter
  signature: none,                  // Signature image or text
  main-color: rgb("#E40019"),     // Main color for the letter
  subject: none,                    // Subject line of the letter
  body,                             // Main content of the letter
) = {
  
  // ==========================================================================
  //                                 Page Setup
  // ==========================================================================
  
  set page(margin: 2cm)
  set text(lang: i18n)

  // ==========================================================================
  //                                 Header
  // ==========================================================================

  utils.recipient-line(sender-name, main-color)
  sender-description

  set align(right)
  utils.recipient-line(recipient-name, main-color)
  recipient-description

  set align(left)




  body
}

#let signature(
  body,
  image
) = {
  
}