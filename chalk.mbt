pub enum Chalk {
  Chalk(String)
}

pub fn to_string(self : Chalk) -> String {
  match self {
    Chalk(str) => str
  }
}

pub fn output(self : Chalk, logger : Logger) -> Unit {
  logger.write_string(self.to_string())
}
