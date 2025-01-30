#set document(
  title: "剑与巫术完全版角色卡",
  author: ("Matt Finch", "Paro"),
)

#let text-size = 10.5pt
#set text(
  font: ("BaskervilleF", "Source Han Serif SC"),
  top-edge: text-size,
)

#set par(
  leading: text-size / 4,
  spacing: text-size,
)

#let page-margin = (
  x: (210mm - text-size * 46.5) / 2,
  y: (297mm - text-size * 0.25 * 282) / 2,
)

#set page(
  margin: (x: 0em, y: page-margin.y),
)

#grid(
  columns: (1fr, 1fr, 1fr),
  row-gutter: text-size * 2,
  grid.cell(
    x: 0, y: 0,
    inset: (left: page-margin.x),
  )[
    *姓名*：

    *性别*：\
    *年龄*：
  ],
  grid.cell(
    x: 0, y: 1,
    rowspan: 2,
    inset: (left: page-margin.x),
  )[
    *力量*：\
    #h(1em)命中加值：\
    #h(1em)伤害加值：\
    #h(1em)破门概率：

    *敏捷*：\
    #h(1em)投射命中/护甲加值：

    *体质*：\
    #h(1em)耐力骰加值：\
    #h(1em)复活成功率：

    *智力*：\
    #h(1em)额外语言：\
    #h(1em)法术环级上限：\
    #h(1em)学习法术成功率：\
    #h(1em)每环可知法术上下限：

    *感知*：\
    #h(1em)额外 1 环牧师法术：\
    #h(1em)经验加值：

    *魅力*：\
    #h(1em)特殊佣役上限：\
    #h(1em)随从士气：\
    #h(1em)经验加值：\
  ],
  grid.cell(
    x: 0, y: 3,
    inset: (left: page-margin.x)
  )[
    *职业/等级*：\
    #h(1em)经验：\
    #h(1em)关键属性：\
    #h(1em)总经验倍率：\
    #h(1em)升级所需经验：

    *职业命中加值*：

    *职业能力*：\
  ],
  grid.cell(x: 1, y: 0)[
    *耐力骰*（HD）：\
    *耐力/上限*：

    *豁免难度*：
  ],
  grid.cell(x: 2, y: 0)[
    *阵营*：

    *种族*：\
    *种族能力*：
  ],
  grid.cell(
    x: 1, y: 1,
    colspan: 2,
    inset: (right: page-margin.x)
  )[
    *护甲等级*（AC）：

    #grid(
      columns: (auto, 1fr, 1fr, 1fr, 1fr),
      column-gutter: (1fr, 0pt, 0pt, 0pt),
      align: (right, left, left, left, left),
      row-gutter: text-size / 4,
      [*主武器*：], [命中：], [伤害：], [], [],
      [*副武器*：], [命中：], [伤害：], [], [],
      [*远程武器*：], [命中：], [伤害：], [射程：], [射速：],
      [*弹药*：], ..([□□□□□],) * 4
    )
  ],
  grid.cell(x: 1, y: 2, rowspan: 2)[
    *装备*（1 行 = 5 磅 = 50 硬币）：

    #enum(
      [（18 力）],
      [],
      [],
      [],
      [（17 力）],
      [],
      [],
      [（16 力）],
      [（13 力）],
      [（9 力）],
      [（7 力）],
      [（5 力）],
      [（3 力）],
      ..([],) * 12,
      [（¾ 速）],
      ..([],) * 4,
      [（½ 速）],
      ..([],) * 8,
      [],
      [（¼ 速）],
      [],
      [],
    )
  ],
  grid.cell(x: 2, y: 2, rowspan: 2)[
    *法术书*：

    #enum(
      ..(linebreak() + box(height: text-size),) * 21,
      []
    )
  ]
)
