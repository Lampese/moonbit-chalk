///|
pub(all) enum BackGroundColors {
  BgBlack
  BgRed
  BgGreen
  BgYellow
  BgBlue
  BgMagenta
  BgCyan
  BgWhite
  BgBlackBright
  BgRedBright
  BgGreenBright
  BgYellowBright
  BgBlueBright
  BgMagentaBright
  BgCyanBright
  BgWhiteBright
}

///|
fn backgroud_color_to_index(color : BackGroundColors) -> Int {
  match color {
    BgBlack => 40
    BgRed => 41
    BgGreen => 42
    BgYellow => 43
    BgBlue => 44
    BgMagenta => 45
    BgCyan => 46
    BgWhite => 47
    BgBlackBright => 100
    BgRedBright => 101
    BgGreenBright => 102
    BgYellowBright => 103
    BgBlueBright => 104
    BgMagentaBright => 105
    BgCyanBright => 106
    BgWhiteBright => 107
  }
}
