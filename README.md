## MoonBit-Chalk

MoonBit-Chalk provides some APIs for terminal color rendering, including rendering APIs for formatting, background color, and font color.

### Usage

Use Chalk to construct a Chalk object and attach properties to it through chain calls.

Chalk provides three types of enum internally for setting properties: text color(Color enum), background color(BackGroundColors enum), and format(Modifier enum).

```moonbit
let str = Chalk("Hello World!").color(Red).background(BgBlue).modifier(Underline)
```

Chalk has implemented Show Trait so you can use it as string directly.

```moonbit
println(Chalk("Hello World!").color(Red))
```
