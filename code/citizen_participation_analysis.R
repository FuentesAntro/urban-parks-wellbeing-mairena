library(ggplot2)

# ==================== DATOS ====================
df2 <- data.frame(
  Respuesta = factor(c("No", "No sabe", "Sí"), levels = c("Sí", "No sabe", "No")),
  n = c(45, 72, 108), 
  pct = c(20, 32, 48)
)

# ==================== GRÁFICO ====================
p2 <- ggplot(df2, aes(x = n, y = Respuesta, fill = Respuesta)) +
  geom_col(width = 0.68, color = "white", linewidth = 0.9) +

  # Porcentajes y números
  geom_text(aes(label = paste0(pct, "% (", n, ")")),
            hjust = -0.1,
            size = 4.8,
            fontface = "bold",
            color = "#1F2A44") +

  scale_fill_manual(values = c(
    "Sí" = "#2A9D8F",      # Verde
    "No sabe" = "#8D99AE",  # Gris
    "No" = "#E63946"        # Rojo suave
  )) +

  labs(
    title = "Percepción ciudadana sobre la participación\nen los nuevos proyectos de espacios verdes",
    subtitle = "¿Considera que los nuevos proyectos han tenido en cuenta la opinión de los vecinos?",
    x = "Número de respuestas",
    y = NULL,
    caption = "Elaboración propia. Encuesta 'Parques y Bienestar en Mairena del Aljarafe' (2026) · n = 225"
  ) +

  theme_minimal(base_size = 12) +
  theme(
    plot.background = element_rect(fill = "#F9F9F9", color = NA),
    panel.background = element_rect(fill = "#F9F9F9", color = NA),
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(color = "#E5E5E5"),
    plot.title = element_text(face = "bold", size = 15.5, color = "#1F2A44", lineheight = 1.15),
    plot.subtitle = element_text(size = 11, color = "#555555", margin = margin(b = 18)),
    plot.caption = element_text(size = 9, color = "#777777", hjust = 0, margin = margin(t = 18)),
    axis.text.y = element_text(size = 12, face = "bold", color = "#2B2B2B"),
    axis.text.x = element_text(size = 10),
    legend.position = "none",
    plot.margin = margin(25, 30, 20, 20)
  )

print(p2)

# Guardar en alta calidad
ggsave("Participacion_Ciudadana_Proyectos.png", p2, width = 19, height = 13, units = "cm", dpi = 320, bg = "white")
