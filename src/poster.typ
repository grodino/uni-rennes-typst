#import "colors.typ": *

#let header(author, title, logos) = grid(columns: (1.1fr, 6fr, 2fr), rows: (100%,))[
  #set align(center + horizon)
  #logos.at("left")
][
  #set align(left + horizon)

  #block(text(font: "UniRennes", weight: "light", size: 120pt, title))
  #v(.5em)

  #text(size: 34pt, author)
][
  #set align(center + horizon)
  #logos.at("right")
]

#let unirennes-poster(
  author: [],
  title: [],
  info: [],
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
    header: header(author, title, logos),
    footer: block(fill: black, width: 100%, height: 100%, inset: (x: 1em))[
      #set align(horizon)
      #set text(fill: white)
      #info
    ],
  )

  // List marker
  set list(marker: sym.triangle.filled.r)

  // Regular text properties
  set text(font: "Newsreader", size: 32pt)

  show heading: it => [
    #set text(font: "UniRennes", size: 60pt)
    #set align(center)
    #it
  ]

  block(height: 100%, width: 100%, inset: 2cm, columns(3, gutter: 2cm, body))
}
