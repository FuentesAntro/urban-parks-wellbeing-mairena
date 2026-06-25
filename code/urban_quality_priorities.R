library(ggplot2)

df_p6 <- data.frame(
  Categoria = c("Mantenimiento\ny Arreglos", "Sombra y\nVegetación",
                "Limpieza", "Fuentes y\nServicios",
                "Actividades\ny Ocio", "Vigilancia y\nSeguridad"),
  Valor = c(62, 33, 25, 18, 11, 9)
)

ggplot(df_p6, aes(x = reorder(Categoria, Valor), y = Valor, fill = Categoria)) +
  geom_col(width = 0.8, color = "#222222", size = 0.3) +
  ylim(-15, 85) +
  coord_polar(start = 0, clip = "off") +
  scale_fill_manual(values = c(
    "Mantenimiento\ny Arreglos" = "#FF6700",
    "Sombra y\nVegetación" = "#39FF14",
    "Limpieza" = "#00F5FF",
    "Fuentes y\nServicios" = "#FFD700",
    "Actividades\ny Ocio" = "#7D26CD",
    "Vigilancia y\nSeguridad" = "#FF007F"
  )) +
  geom_text(aes(label = Valor), y = df_p6$Valor + 3.5, fontface = "bold", size = 4.5) +
  labs(
    title = "PERCEPCIÓN DE CALIDAD URBANA 2026",
    subtitle = "Pregunta 6: Prioridades de gestión detectadas en el discurso vecinal",
    caption = "Fuente: Elaboración propia basada en encuesta (2026)",
    fill = "Dimensiones:"
  ) +
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "#FDFDFD", color = "#D1D1D1", size = 1.5),
    panel.background = element_rect(fill = "white", color = NA),
    plot.title = element_text(face = "bold", size = 18, color = "#1A1A1A", hjust = 0),
    plot.subtitle = element_text(size = 10, color = "#666666", face = "italic", hjust = 0),
    plot.caption = element_text(size = 9, color = "#333333", face = "bold", hjust = 1, margin = margin(t = 15)),
    legend.position = "bottom",
    legend.title = element_text(face = "bold"),
    axis.text.y = element_blank(),
    axis.text.x = element_text(face = "bold", color = "#444444", size = 9),
    axis.title = element_blank(),
    panel.grid = element_line(color = "#F0F0F0"),
    plot.margin = margin(20, 40, 20, 40)
  )
