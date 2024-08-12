pub enum Chalk {
  Cons(Chalk, Render)
  Nil
}

pub fn chalk() -> Chalk {
  Nil
}

pub fn background(self : Chalk, color : BackGroundColors) -> Chalk {
  Cons(self, RenderBackGround(color))
}

pub fn modifier(self : Chalk, modifier : Modifier) -> Chalk {
  Cons(self, RenderModifier(modifier))
}

pub fn color(self : Chalk, color : Colors) -> Chalk {
  Cons(self, RenderColor(color))
}

pub fn render[T : Show](self : Chalk, to_render : T) -> String {
  match self {
    Cons(chalk, now_render) =>
      render(
        chalk,
        match now_render {
          RenderColor(color) => {
            let idx = color_to_index(color)
            let to_render_str = to_render.to_string()
            "\u001B[\{idx}m\{to_render_str}\u001B[39m"
          }
          RenderBackGround(color) => {
            let idx = backgroud_color_to_index(color)
            let to_render_str = to_render.to_string()
            "\u001B[\{idx}m\{to_render_str}\u001B[49m"
          }
          RenderModifier(modifier) => {
            let (start_idx, end_idx) = modifier_to_index(modifier)
            let to_render_str = to_render.to_string()
            "\u001B[\{start_idx}m\{to_render_str}\u001B[\{end_idx}m"
          }
        },
      )
    Nil => to_render.to_string()
  }
}
