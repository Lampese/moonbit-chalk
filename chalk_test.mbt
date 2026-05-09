///|
test "render without styles returns plain text" {
  assert_eq(chalk().render("hello"), "hello")
}

///|
test "render supports Show values" {
  assert_eq(chalk().render(42), "42")
}

///|
test "color render uses foreground ansi codes" {
  assert_eq(
    chalk().color(RedBright).render("hello"),
    "\u001B[91mhello\u001B[39m",
  )
}

///|
test "background render uses background ansi codes" {
  assert_eq(
    chalk().background(BgBlueBright).render("hello"),
    "\u001B[104mhello\u001B[49m",
  )
}

///|
test "modifier render uses start and end ansi codes" {
  assert_eq(
    chalk().modifier(Underline).render("hello"),
    "\u001B[4mhello\u001B[24m",
  )
}

///|
test "reset modifier renders symmetric reset codes" {
  assert_eq(
    chalk().modifier(Reset).render("hello"),
    "\u001B[0mhello\u001B[0m",
  )
}

///|
test "chained styles wrap in call order" {
  let rendered = chalk()
    .background(BgRed)
    .modifier(Bold)
    .color(Green)
    .render("hello")

  assert_eq(
    rendered,
    "\u001B[41m\u001B[1m\u001B[32mhello\u001B[39m\u001B[22m\u001B[49m",
  )
}

///|
test "chalk values are reusable and immutable" {
  let base = chalk().color(Cyan)
  let derived = base.modifier(Italic)

  assert_eq(base.render("hello"), "\u001B[36mhello\u001B[39m")
  assert_eq(
    derived.render("hello"),
    "\u001B[36m\u001B[3mhello\u001B[23m\u001B[39m",
  )
}

///|
test "multiple modifiers nest with independent closing codes" {
  let rendered = chalk().modifier(Underline).modifier(Strikethrough).render("x")
  assert_eq(rendered, "\u001B[4m\u001B[9mx\u001B[29m\u001B[24m")
}
