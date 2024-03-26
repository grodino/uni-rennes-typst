#import "colors.typ": *

#let header(author, title, logo, logos) = grid(columns: (1.1fr, 6fr, 2fr), rows: (100%,))[
  #set align(center + horizon)
  #image(logo, width: 10cm)
][
  #set align(left + horizon)

  #block(text(font: "UniRennes", weight: "light", size: 120pt, title))
  #v(.5em)

  #text(size: 34pt, author)
][
  #set align(center + horizon)
  #stack(
    dir: ltr,
    spacing: 1em,
    stack(
      box(image("logos/inria.png", height: 3cm)),
      box(image("logos/irisa.png", height: 3cm)),
    ),
    // box(image("logos/wide.png", height: 4cm)),
    box(image("logos/peren.png", height: 7cm)),
  )
]

#let unirennes-poster(
  author: [],
  title: [],
  info: [],
  logo: none,
  logos: none,
  split-size: 25%,
  notes: "hide",
  body,
) = {
  // Set the page dimensions
  set page(
    paper: "a0",
    flipped: true,
    margin: (x: 0pt, bottom: 2cm, top: 10cm),
    header-ascent: 0pt,
    footer-descent: 0pt,
    header: header(author, title, logo, logos),
    footer: block(fill: black, width: 100%, height: 100%, inset: (x: 1em))[
      #set align(horizon)
      #set text(fill: white)
      #info
    ],
  )

  // List marker
  set list(marker: sym.triangle.filled.r)

  // Strong with a different color
  // show strong: set text(fill: accent-blue.light)

  // emph with a different color
  // show emph: set text(fill: accent-orange.light)

  // Regular text properties
  set text(font: "Newsreader", size: 32pt)

  show heading: it => [
    #set text(font: "UniRennes", size: 60pt)
    #set align(center)
    #it
  ]

  block(height: 100%, width: 100%, inset: 2cm, columns(3, gutter: 2cm, body))
}
