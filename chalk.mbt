pub enum Chalk {
  Chalk(String)
}

pub fn to_string(self : Chalk) -> String {
  match self {
    Chalk(str) => str
  }
}
  