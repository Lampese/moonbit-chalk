pub enum Modifier {
  Reset
  Blod
  Dim
  Italic
  Underline
  Overline
  Inverse
  Hidden
  Strikethrough
}

fn modifier_to_index(modifier : Modifier) -> (Int, Int) {
  match modifier {
    Reset => (0, 0)
    Blod => (1, 22)
    Dim => (2, 22)
    Italic => (3, 23)
    Underline => (4, 24)
    Overline => (53, 55)
    Inverse => (7, 27)
    Hidden => (8, 28)
    Strikethrough => (9, 29)
  }
}

pub fn modifier(modifier : Modifier, str : String) -> String {
  let (start_idx, end_idx) = modifier_to_index(modifier)
  "\u001B[\(start_idx)m\(str)\u001B[\(end_idx)m"
}
