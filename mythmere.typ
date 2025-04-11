#let mythmere(
  text-size: 10.5pt,
  zh-font: ("Source Han Serif SC",),
  zh-sans-font: ("Source Han Sans SC",),
  en-font: ("BaskervilleF",),
  math-font: ("New Computer Modern Math",),
  raw-font: ("DejaVu Sans Mono",),
  paper: "a5",
) = {
  // private values

  let heading-state = state("mythmere-heading-state", ())

  // exported values

  let leading = text-size * 0.5
  let line-height = text-size + leading
  let par-spacing = line-height / 2 + leading

  let set-heading(offset, scope: auto) = context {
    let scope = scope
    if scope == auto {
      let headings = query(selector(heading).before(here()))
      if headings == () {
        panic("auto scope can only be used after a heading")
      } else {
        scope = headings.last().level
      }
    }
    heading-state.update(prev => (
      prev + ((offset: offset, scope: scope),)
    ))
  }
  let show-heading(level: 1, it) = {
    level += heading-state
      .get()
      .map(it => it.offset)
      .sum(default: 0)
    if level == 1 {
      set text(
        font: zh-sans-font,
        size: text-size * 2.5,
        top-edge: text-size + line-height,
      )
      block(it, above: leading + line-height)
    } else if level == 2 {
      set text(
        font: zh-sans-font,
        size: text-size * 2,
        top-edge: text-size + line-height,
        baseline: text-size * 0.25,
      )
      block(it, above: leading)
    } else if level == 3 {
      set text(
        font: zh-sans-font,
        size: text-size * 1.75,
        top-edge: text-size + line-height,
        baseline: text-size * 0.25,
      )
      block(it, above: leading)
    } else if level == 4 {
      set text(
        size: text-size * 1.5,
        baseline: text-size * -0.25,
      )
      block(
        it,
        width: 100%,
        stroke: (bottom: 0.5pt),
        above: leading + line-height,
        below: leading,
      )
    } else if level == 5 {
      set text(
        size: text-size * 1.25,
        top-edge: text-size,
      )
      block(it, above: leading + line-height)
    } else if level == 6 {
      block(it, below: leading)
    } else {
      panic("unsupported heading level: " + str(level))
    }
  }

  let table-fill-header = rgb("#d1d3d4")
  let table-fill-body = rgb("#f1f1f2")
  let table-fill-alt = rgb("#e6e7e8")

  // @typstyle off
  let table-fill(header: 1, ..break-points) = (
    if header > 0 { (_, y) => (
      if y < header {
        table-fill-header
      } else if (
        calc.even(
          y - (
            (header - 1, ..break-points.pos())
              .rev()
              .find(i => i < y)
          ),
        ) and header > 0
      ) {
        table-fill-body
      }
    ) } else { (_, y) => (
      if calc.even(y) {
        table-fill-body
      } else {
        table-fill-alt
      }
    ) }
  )

  // custom blocks

  let infoblock(
    body,
    indent: false,
    tight: false,
    fill: rgb("#f1f1f2"),
    breakable: false,
  ) = context {
    set par(
      hanging-indent: if indent { 1em } else {
        par.hanging-indent
      },
      spacing: if tight { leading } else { par.spacing },
    )
    set heading(outlined: false)
    block(
      body,
      breakable: breakable,
      width: 100%,
      stroke: 0.5pt,
      fill: fill,
      inset: (x: 1.5em, y: (line-height + leading) / 2),
    )
  }

  let spell(name, range: [], duration: [], ..body) = block(
    breakable: false,
    above: leading + line-height,
  )[
    ==== #{
      set text(text-size * 1.25)
      name
    }

    #block(inset: (left: 1em), above: leading)[
      #set text(9pt)
      *射程*：#range\
      *持续时间*：#duration
    ]

    #set par(spacing: leading)
    #for body in body.pos() {
      block(body)
    }
  ]

  let notes(body) = text(size: 9pt, body)

  let theme(doc) = {
    // inline styling

    set text(
      font: en-font.map(f => (
        name: f,
        covers: "latin-in-cjk",
      ))
        + zh-font,
      size: text-size,
      top-edge: text-size,
      spacing: 0.25em,
      lang: "zh",
      region: "cn",
      script: "hans",
      features: ("fwid",),
    )
    show math.equation: set text(
      font: math-font + zh-font,
      weight: "regular",
    )
    show raw: set text(
      font: raw-font + zh-font,
      size: text-size,
      spacing: 100%,
    )

    set underline(offset: 0.15em)

    show selector(link).or(ref): set text(
      fill: rgb("#007300"),
    )

    // block styling

    set block(below: par-spacing)

    set par(
      justify: true,
      leading: leading,
    )

    show heading: it => {
      heading-state.update(prev => (
        prev.filter(elem => (
          elem.scope == none or elem.scope < it.level
        ))
      ))
      context show-heading(it.body, level: it.level)
      heading-state.update(prev => (
        prev.filter(elem => elem.scope != none)
      ))
    }

    show outline: set block(below: leading)

    set list(
      marker: ([•], [‣], [–]).map(box.with(width: 0.5em)),
    )

    set figure(supplement: none, gap: par-spacing)
    set figure.caption(position: top)
    show figure.caption: align.with(left)

    set table(
      align: left,
      stroke: none,
      fill: table-fill(),
      inset: (
        x: 0.5em,
        top: text-size * 0.15,
        bottom: text-size * 0.35,
      ),
    )
    show table: block.with(
      inset: (
        top: text-size * -0.15,
        bottom: text-size * -0.35,
      ),
    )
    show table: set block(breakable: true)

    set columns(gutter: 1em)

    // page styling

    set page(
      ..(
        a5: (
          paper: "a5",
          margin: (
            x: (148mm - text-size * 30) / 2,
            y: (210mm - (line-height * 32 - leading)) / 2,
          ),
        ),
        a4: (
          paper: "a4",
          margin: (
            x: (210mm - text-size * 43) / 2,
            y: (297mm - (line-height * 45 - leading)) / 2,
          ),
        ),
      ).at(paper),
      footer-descent: par-spacing,
      footer: context align(
        if calc.odd(counter(page).get().at(0)) {
          right
        } else {
          left
        },
        counter(page).display(),
      ),
    )

    // doc

    doc
  }

  (
    leading: leading,
    line-height: line-height,
    par-spacing: par-spacing,
    set-heading: set-heading,
    show-heading: show-heading,
    table-fill-header: table-fill-header,
    table-fill-body: table-fill-body,
    table-fill-alt: table-fill-alt,
    table-fill: table-fill,
    infoblock: infoblock,
    spell: spell,
    notes: notes,
    theme: theme,
  )
}

#[
  #let (theme, set-heading) = mythmere()
  #show: theme

  = Heading 1 标题 1

  Body text 正文

  == Heading 2 标题 2

  Body text 正文

  #set-heading(1, scope: none)
  === Heading 3 标题 3
  #set-heading(-1)

  Body text 正文

  ==== Heading 4 标题 4

  Body text 正文

  ===== Heading 5 标题 5
  #set-heading(1)

  Body text 正文

  ====== Heading 6 标题 6

  Body text 正文

  ===== Heading 5

  ====== Heading 6 标题 6
]
