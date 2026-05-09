///|
pub(all) enum Chalk {
  Cons(Chalk, Render)
  Nil
}

///|
pub fn chalk() -> Chalk {
  Nil
}

///|
pub fn Chalk::background(self : Chalk, color : BackGroundColors) -> Chalk {
  Cons(self, RenderBackGround(color))
}

///|
pub fn Chalk::modifier(self : Chalk, modifier : Modifier) -> Chalk {
  Cons(self, RenderModifier(modifier))
}

///|
pub fn Chalk::color(self : Chalk, color : Colors) -> Chalk {
  Cons(self, RenderColor(color))
}

pub fn[T : Show] Chalk::render(self : Chalk, to_render : T) -> String {
  let mut result = to_render.to_string()
  let mut current_chalk = self
  
  while true {
    match current_chalk {
      Cons(next_chalk, action) => {
        result = match action {
          RenderColor(color) =>
            "\u001B[\{color_to_index(color)}m\{result}\u001B[39m"
          RenderBackGround(color) =>
            "\u001B[\{background_color_to_index(color)}m\{result}\u001B[49m"
          RenderModifier(modifier) => {
            let (start_idx, end_idx) = modifier_to_index(modifier)
            "\u001B[\{start_idx}m\{result}\u001B[\{end_idx}m"
          }
        }
        current_chalk = next_chalk
      }
      Nil => break
    }
  }
  result
}