# =====================================================
# GRÁFICO 1 - COORDINACIÓN INTERINSTITUCIONAL
# TFG Antropología Urbana - Estilo Profesional
# =====================================================
library(ggplot2)
library(dplyr)

# ==================== DATOS ====================
df <- data.frame(
  likert = factor(1:5, levels = 1:5),
  n = c(3, 8, 24, 72, 118), # Cambia estos números por tus datos reales
  label = c("1\nNada\nimportante", "2", "3", "4", "5\nMuy\nimportante")
)

N <- sum(df$n)

df <- df %>%
  mutate(
    pct = n / N * 100,
    label_pct = sprintf("%.1f%%", pct),
    label_n = paste0("n=", n)
  )

# ==================== GRÁFICO ====================
p1 <- ggplot(df, aes(x = likert, y = pct, fill = likert)) +
  geom_col(width = 0.65, color = "white", linewidth = 0.8) +
  
  # Porcentajes encima
  geom_text(aes(label = label_pct), vjust = -0.6, size = 4.8, fontface = "bold", color = "#1F2A44") +
  
  # n debajo
  geom_text(aes(label = label_n, y = pct - 1.5), vjust = 1, size = 3.2, color = "#555555") +
  
  # Etiquetas dentro de las barras más altas
  geom_text(data = subset(df, pct > 15), aes(label = label),
            vjust = 1.8, size = 3.4, color = "white", fontface = "bold", lineheight = 0.95) +
  
  scale_fill_manual(values = c(
    "1" = "#DCE6F0",
    "2" = "#A3C4D4",
    "3" = "#5A9AB8",
    "4" = "#2B7A9B",
    "5" = "#1B4A6B"
  )) +
  
  scale_y_continuous(
    limits = c(0, 68),
    breaks = seq(0, 60, 20),
    labels = function(x) paste0(x, "%")
  ) +
  
  labs(
    title = "Percepción ciudadana sobre la importancia\nde la coordinación interinstitucional",
    subtitle = paste0("Escala Likert 1 (Nada importante) – 5 (Muy importante) · n = ", N),
    x = "Nivel de importancia",
    y = "Porcentaje de respuestas (%)",
    caption = "Elaboración propia a partir de encuesta (2026) · Parques y Bienestar en Mairena del Aljarafe"
  ) +
  
  theme_minimal(base_size = 11.5) +
  theme(
    plot.background = element_rect(fill = "#F9F9F9", color = NA),
    panel.background = element_rect(fill = "#F9F9F9", color = NA),
    panel.grid.major.y = element_line(color = "#E5E5E5"),
    panel.grid.major.x = element_blank(),
    plot.title = element_text(face = "bold", size = 15.5, color = "#0F1C38", lineheight = 1.15),
    plot.subtitle = element_text(size = 11, color = "#555555", margin = margin(b = 18)),
    plot.caption = element_text(size = 8.5, color = "#777777", hjust = 1, margin = margin(t = 15)),
    axis.title.x = element_text(size = 10.5, margin = margin(t = 12)),
    axis.title.y = element_text(size = 10.5, margin = margin(r = 12)),
    axis.text.x = element_text(size = 10, lineheight = 1.1),
    axis.text.y = element_text(size = 9.5),
    legend.position = "none",
    plot.margin = margin(25, 20, 20, 20)
  )

print(p1)

# Guardar en alta calidad
ggsave("Grafico_Coordinacion_Institucional.png", p1, width = 18, height = 13, units = "cm", dpi = 320, bg = "white")
