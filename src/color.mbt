///|
pub(all) enum Colors {
  Black
  Red
  Green
  Yellow
  Blue
  Magenta
  Cyan
  White
  BlackBright
  RedBright
  GreenBright
  YellowBright
  BlueBright
  MagentaBright
  CyanBright
  WhiteBright
}

///|
fn color_to_index(color : Colors) -> Int {
  match color {
    Black => 30
    Red => 31
    Green => 32
    Yellow => 33
    Blue => 34
    Magenta => 35
    Cyan => 36
    White => 37
    BlackBright => 90
    RedBright => 91
    GreenBright => 92
    YellowBright => 93
    BlueBright => 94
    MagentaBright => 95
    CyanBright => 96
    WhiteBright => 97
  }
}
