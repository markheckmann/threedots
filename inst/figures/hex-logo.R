# create hex sticker

library(hexSticker)
library(showtext)
library(ggplot2)
library(ggfx)

path <- "man/figures/logo.png"
color <- "green"
fill <- "black"
family <- "3dots"

font_add_google("Share Tech Mono", "3dots")
showtext_auto()

df <- data.frame(x = 1:3, y = c(1, 1, 1))
p <- ggplot(aes(x, y), data = df) +
  with_outer_glow(
    geom_point(size = 7, color = color),
    colour = 'green',
    sigma = 10,
    expand = 10
  ) +
  coord_cartesian(c(.5, 3.5)) +
  theme_void() +
  theme_transparent()

set.seed(2) # for constant spotlight position
sticker(p,
  p_color = color, p_fontface = "bold", package = "threedots",
  p_x = 1, p_y = 1.4, p_size = 22,
  s_x = 1, s_y = .80,
  spotlight = TRUE, l_x = .9, l_y = .98, l_width = 5, l_height = 5, l_alpha = .3,
  h_fill = fill, h_color = color, p_family = family,
  s_width = 1.3, s_height = 1, filename = path
)

# file.show(path)
