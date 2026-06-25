library(waffle)
library(ggplot2)

vals <- c(
  "Varios espacios (34%)" = 34,
  "Parque Central (30%)" = 30,
  "Parque Porzuna (20%)" = 20,
  "Parques de barrio (12%)" = 12,
  "Otros espacios (4%)" = 4
)

colores <- c(
  "Varios espacios (34%)" = "#E63946",
  "Parque Central (30%)" = "#2EC4B6",
  "Parque Porzuna (20%)" = "#FF9F1C",
  "Parques de barrio (12%)" = "#9B5DE5",
  "Otros espacios (4%)" = "#00BBF9"
)

waffle(
  vals,
  rows = 5,
  size = 1.2,
  colors = colores,
  legend_pos = "bottom",
  title = "Espacio verde frecuentado con mayor asiduidad",
  xlab = "Cada cuadrado = 1% de encuestados · Pregunta 2 · n = 225 · Elaboración propia · TFG Antropología Social y Cultural"
) +
  theme(
    plot.title = element_text(face = "bold", size = 18, color = "#1a1a2e", margin = margin(b = 15)),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(25, 25, 15, 25),
    legend.text = element_text(size = 11, color = "#333333"),
    legend.key.size = unit(1.2, "lines"),
    axis.title.x = element_text(size = 8.5, color = "grey55", margin = margin(t = 10))
  )
