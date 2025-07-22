// CV and Cover Letter Template in Typst

// Author: Pierre GUYOT (@toyhugs - pierre.guyot@toyhugs.fr)
// Main repository: https://github.com/ToyHugs/toy-cv
// Date: 2025-07-20
// License: MIT License

#import "utils.typ" as utils



// ===========================================================================
//                                 Cover Letter
// ===========================================================================


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


// ===========================================================================
//                                     CV
// ===========================================================================

// CV Template
// Usage:
// #show : cv.with(
//   arguments...
// )
#let cv(
  main-color: rgb("#E40019"), // Main color for the CV
  secondary-color: luma(75%),
  tertiary-color: white,
  title: none, // Your name or main title
  subtitle: none, // Your subtitle or description
  avatar: none, // Profile image
  avatar-size: 75pt, // Size of the avatar image
  left-content: none,
  columns-ratio: 30%, // Ratio of left to right content
  right-content,
) = {
  // ==========================================================================
  //                                 Page Setup
  // ==========================================================================

  let margin-placement = 20pt
  let error-placement = 1pt

  // Margin rectified with error placement
  let margin-rectified = margin-placement + error-placement

  set page(margin: margin-placement)
  set text(size: 11pt, font: "Inter")

  place(left, dx: -margin-rectified)[#rect(
      fill: secondary-color,

      width: (columns-ratio + 2 * margin-placement + error-placement),
      height: (100% + margin-rectified),
    )]

  // ==========================================================================
  //                                  Header
  // ==========================================================================

  // Define the header grid layout without printing it
  let header-grid = {
    set text(fill: tertiary-color)
    set par(spacing: 0pt, justify: true)

    grid(
      columns: (1fr, auto),
      align: horizon,
      gutter: margin-placement,

      // Title and Subtitle
      [
        #set align(top)
        #if title != none {
          set text(size: 2.2em, weight: 700, fill: tertiary-color)
          title
        }

        #v(1em)

        #if subtitle != none {
          set text(size: 1.2em)
          text(subtitle)
        }

      ],

      // Avatar
      [
        #if avatar != none {
          box(
            width: avatar-size,
            height: avatar-size,
            radius: 50%,
            stroke: 4pt + tertiary-color,
            clip: true,
          )[
            #image(avatar)
          ]
        }
      ],
    )
  }

  // Use layout function to get the height of the header grid (for the background rectangle)
  layout(size => {
    // Get the size of the header grid
    let grid-size = measure(block(width: size.width, header-grid))

    // Create a rectangle for the header background
    place(top, dx: -margin-rectified, dy: -margin-rectified)[
      #rect(
        fill: main-color,
        height: grid-size.height + (margin-rectified) + 1em,
        width: size.width + 2 * margin-rectified,
      )
    ]

    // Place the header grid
    header-grid
  })

  v(1em)

  // ==========================================================================
  //                                 Main Content
  // ==========================================================================

  grid(
    columns: (columns-ratio, 1fr),
    // Left and right content columns
    align: top,
    gutter: 2 * margin-placement,

    // ========================================================================
    //                               Left Content
    // ========================================================================

    [
      #left-content
    ],

    // ========================================================================
    //                               Right Content
    // ========================================================================

    [
      #right-content
    ],
  )
}



// ===========================================================================
//                                   CV Utils
// ===========================================================================

// Function for creating a section for right column in CV
#let right-column-section(
  title: none, // Title of the entry
  ..args,
) = {}
