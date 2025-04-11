#import "mythmere.typ": mythmere

#let (
  theme,
  leading,
  line-height,
  par-spacing,
  table-fill,
  table-fill-header,
  table-fill-alt,
) = mythmere()
#show: theme

#let zh-sans-font = "Source Han Sans SC"
#let text-size = 10.5pt

#set document(
  title: "剑与巫术完全版角色卡",
  author: ("Matt Finch", "Paro"),
)

#set page(
  columns: 2,
  footer: none,
  margin: (
    x: (148mm - text-size * 32) / 2,
    y: (210mm - (line-height * 33 - leading)) / 2,
  ),
)

#show heading: it => block(
  width: 100%,
  fill: table-fill-header,
  inset: (y: line-height / 4),
  above: par-spacing,
  below: leading,
  align(
    center,
    text(
      it.body,
      font: zh-sans-font,
      size: 12pt,
      weight: 600,
    ),
  ),
)

= 角色

*姓名*：\
*职业*：\
*阵营*：\
*种族*：\

= 属性

*力量*：\
#h(1em)命中加值：\
#h(1em)伤害加值：\
#h(1em)破门概率：\
#h(1em)负重加值：\

*敏捷*：\
#h(1em)投射命中/护甲加值：\

*体质*：\
#h(1em)耐力骰加值：\
#h(1em)复活成功率：\

*智力*：\
#h(1em)额外语言：\
#h(1em)法术环级上限：\
#h(1em)学习法术成功率：\
#h(1em)每环可知法术上下限：\

*感知*：\
#h(1em)额外 1 环牧师法术：\
#h(1em)经验加值：\

*魅力*：\
#h(1em)特殊佣役上限：\
#h(1em)随从士气：\
#h(1em)经验加值：\

= 成长

*等级*：#h(1fr)*经验*：#h(1fr)\
*升级所需经验*：\
*关键属性*：\
*总经验加值*：\

= 防御

*耐力骰*（HD）：\
*耐力*：#h(1fr)*上限*：#h(1fr)\

*护甲等级*（AC）：\
#h(1em)护甲的护甲加值：\

*豁免难度*：\
#h(1em)特殊加值：\

= 攻击

*职业命中加值*：\

*主近战武器*：\
#h(1em)命中：#h(3.75em)伤害：#h(1fr)\
*副近战武器*：\
#h(1em)命中：#h(3.75em)伤害：#h(1fr)\
*投射武器*：\
#h(1em)射速：#h(3.75em)射程：#h(1fr)\
#h(1em)命中：\
*常用弹药*：\
#h(1em)数目：□□□□□#h(0.5em)□□□□□\
#h(4em)□□□□□#h(0.5em)□□□□□\
#h(1em)伤害：\
*特殊弹药*：\
#h(1em)数目：□□□□□#h(0.5em)□□□□□\
#h(4em)□□□□□#h(0.5em)□□□□□\
#h(1em)伤害：\

#pagebreak()

= 能力

*职业能力*：

#v(1fr)

*种族能力*：

#v(line-height * 3 - leading)

#table(
  columns: (1fr, auto, auto),
  table.header(
    [*盗贼技能*],
    [*成功率*],
    [*种族加值*],
  ),

  [攀爬], [], [],
  [精细操作], [], [],
  [偷听声音], [], [],
  [遁入阴影], [], [],
  [行动无声], [], [],
  [开锁], [], [],
)

#v(line-height / 2)

#colbreak()

= 装备

#table(
  columns: (1fr, auto, auto),
  table.header(
    [*物品*],
    [*重量*\/磅],
    [*价格*\/gp],
  ),
  ..(v(text-size),) * 3 * 23,
  table.cell(colspan: 3, fill: table-fill-alt)[*总计*]
)

#v(line-height - par-spacing + leading)

#table(
  columns: (1fr, auto),
  table.header(
    [*负重上限*],
    [*基础移动速度*],
  ),

  [], [12],
  [], [9],
  [], [6],
  [], [3],
)

#pagebreak()

#place(
  top,
  [= 法术],
  float: true,
  scope: "parent",
  clearance: leading,
)

#table(
  columns: (1fr, auto, auto),
  fill: table-fill(31),
  table.header(
    [*环级/名称/准备*],
    [*射程*],
    [*持续*],
  ),
  ..(v(text-size),) * 3 * 62,
)
