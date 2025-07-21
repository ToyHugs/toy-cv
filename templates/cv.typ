#import "../src/lib.typ": *

#let main-color = rgb("#E40019")

#let left-content = [
  #utils.contact-section(main-color: main-color, i18n: "en", contact-entries: (
    (
      logo-name: "envelope",
      logo-link: "mailto:john.doe@example.com",
      logo-text: "john.doe@example.com",
    ),
    (
      logo-name: "github",
      logo-link: "https://github.com/404",
      logo-text: "GitHub - John Doe",
      logo-font: "Font Awesome 6 Brands",
    ),
    (
      logo-name: "location-dot",
      logo-text: "Moon",
    ),
    (
      logo-name: "car",
      logo-text: "Driving License",
    ),
  ))
  #v(1fr)
  #utils.left-section(title: "Languages", [#lorem(30)]),
]


#show: cv.with(
  title: "John Doe",
  subtitle: [#lorem(30)],
  avatar: "/templates/assets/avatar.jpg",
  avatar-size: 3cm,
  left-content: left-content,
)


