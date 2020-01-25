import math, strformat

type Color* = tuple[r: int, g: int, b: int]

proc computeColor*(str: string): Color =
  ## computes rgb from string
  var commulated = 0;
  for ch in str:
    commulated += ch.ord
  var communist = commulated mod 235 + 20
  return (
    int communist, 
    int communist.float32.pow(2.0) mod 255, 
    int communist.float32.pow(3.0) mod 255
  )

proc forCss*(color: Color): string =
  ## converts color to "rgb(r,g,b)" string
  fmt"rgb({color.r},{color.g},{color.b})"

proc inlineHtml*(str: string): string = 
  let color = computeColor(str).forCss
  fmt"""<span style="color: {color}">{str}</span>"""

when isMainModule:
  assert computeColor("sn0re") == (38,169,47)
  assert computeColor("sn0re").forCss == "rgb(38,169,47)"