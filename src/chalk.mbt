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
pub fn background(self : Chalk, color : BackGroundColors) -> Chalk {
  Cons(self, RenderBackGround(color))
}

///|
pub fn modifier(self : Chalk, modifier : Modifier) -> Chalk {
  Cons(self, RenderModifier(modifier))
}

///|
pub fn color(self : Chalk, color : Colors) -> Chalk {
  Cons(self, RenderColor(color))
}

///|
pub fn[T : Show] render(self : Chalk, to_render : T) -> String {
  loop (to_render.to_string(), self) {
    (s, Cons(chalk, now_render)) =>
      continue (
          match now_render {
            RenderColor(color) =>
              "\u001B[\{color_to_index(color)}m\{s}\u001B[39m"
            RenderBackGround(color) =>
              "\u001B[\{background_color_to_index(color)}m\{s}\u001B[49m"
            RenderModifier(modifier) => {
              let (start_idx, end_idx) = modifier_to_index(modifier)
              "\u001B[\{start_idx}m\{s}\u001B[\{end_idx}m"
            }
          },
          chalk,
        )
    (s, Nil) => s
  }
}
