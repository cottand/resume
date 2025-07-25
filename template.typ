#import "@preview/fontawesome:0.5.0": fa-icon, fa-stack

#let primary_colour = rgb(38, 119, 138)
#let link_colour = rgb(38, 119, 138)

#let icon(name, shift: 1.5pt, boxed: true) = {
  box(
    baseline: shift,
    inset: 2pt, outset: 2pt, radius: 0pt, if boxed {
      let boxSize = 14pt
      fa-stack(
        fa-icon-args: (solid: true), ("square", (fill: primary_colour, size: boxSize)), (name, (fill: white, size: boxSize * 50%)),
      )
    } else {
      fa-icon(name, fill: if boxed { white } else { primary_colour })
    },
  )
  h(0.2em)
}

#let term(period, location) = {
  text(9pt)[#icon("calendar") #period #h(1fr) #icon("location") #location]
}

#let styled-link(dest, content) = text(fill: link_colour, link(dest, content))

#let vantage(
  name: "", links: (), tagline: [], topSide: [], leftSide, rightSide, bottomSide: [],
) = {
  set document(title: name + "'s CV", author: name)
  set text(9.5pt, weight: "light", font: "Fira Sans")
  set par(leading: 0.65em)

  // Set bullet point style
  set list(
    indent: 0em, body-indent: 0.6em, marker: text(fill: primary_colour, weight: "bold", "•"),
  )
  set page(margin: (top: 1.6cm, bottom: 1.6cm, left: 1.6cm, right: 1.6cm))

  show heading.where(level: 1) : it => text(16pt, [#{ it.body } #v(0.5pt)])

  show heading.where(level: 2): it => [
    #v(0.5em)
    #box(
      fill: primary_colour, inset: (x: 3pt, y: 3pt), radius: 0pt, text(fill: white, weight: "bold", [#upper(it.body)]),
    )
    //#v(0em)
  ]

  show heading.where(level: 3): it => [
    #v(0.2em)
    #text(size: 12pt, weight: "bold", it.body)
  ]

  show heading.where(level: 4): it => text(fill: primary_colour, it.body)

  let formatLink(service) = {
    set text(8pt)
    let icon = icon.with(shift: 5pt)
    icon(service.icon)
    if "display" in service.keys() {
      link(service.link)[#{ service.display }]
    } else {
      link(service.link)
    }
  }

  grid(
    columns: 2, gutter: 2em, box(
      fill: primary_colour, inset: 6pt, radius: 2pt, text(fill: white, size: 20pt, weight: "bold", [#name]),
    ), links
    .map(formatLink)
    .map(box)
   // .join()
    .join(h(1em)),
  )

  text(size: 10pt, tagline)

  v(1em)

  topSide

  grid(columns: (5fr, 3fr), column-gutter: 1.5em, leftSide, rightSide)

  bottomSide
}
