library(ggplot2)
library(ggridges)
library(dplyr)
library(readxl)

# Cargar datos
data <- read_excel("C:/Users/Pc1/Desktop/Parques y bienestar en Mairena del Aljarafe.xlsx")
colnames(data) <- c("timestamp", "zona", "espacio", "motivo", "p4_coord", "p5_opinion", "p6_cambio", "p7_reforestacion")

# Procesamiento de datos
data <- data %>%
  filter(!is.na(p4_coord), !is.na(p5_opinion)) %>%
  mutate(
    p5_label = case_when(
      p5_opinion == "Si" ~ "Sí — Se tuvo en cuenta",
      p5_opinion == "No" ~ "NO — No se tuvo en cuenta",
      TRUE ~ "NO SABE"
    ),
    p5_label = factor(p5_label, levels = c(
      "NO — No se tuvo en cuenta",
      "NO SABE",
      "Sí — Se tuvo en cuenta"
    ))
  )

# Medianas por grupo (exactas del Excel)
medianas <- data.frame(
  p5_label = factor(c("Sí — Se tuvo en cuenta", "NO SABE", "NO — No se tuvo en cuenta"),
                    levels = c("NO — No se tuvo en cuenta", "NO SABE", "Sí — Se tuvo en cuenta")),
  mediana = c(4, 4, 3),
  label = c("mediana = 4", "mediana = 4", "mediana = 3")
)

media_global <- 3.56

# Generar Gráfico de Crestas (Density Ridges)
ggplot(data, aes(x = p4_coord, y = p5_label, fill = p5_label)) +
  geom_density_ridges(
    alpha = 0.80,
    scale = 2.8,
    size = 0.3,
    color = NA,
    jittered_points = TRUE,
    point_alpha = 0.18,
    point_size = 1.0,
    point_color = "white",
    position = position_raincloud(adjust_vlines = TRUE)
  ) +
  # Línea discontinua media global
  geom_vline(xintercept = media_global, linewidth = 0.6, linetype = "dashed", color = "grey50") +
  # Etiqueta media global
  annotate("text", x = media_global + 0.07, y = 3.85,
           label = paste0("media global\n", media_global),
           color = "grey40", size = 3.0, hjust = 0, lineheight = 0.9) +
  # Líneas blancas de mediana por grupo
  geom_vline(data = medianas, aes(xintercept = mediana), color = "white", linewidth = 1.0) +
  # Etiquetas de mediana
  geom_text(data = medianas,
            aes(x = mediana + 0.07, y = as.numeric(p5_label) + 0.18, label = label),
            color = "grey35", size = 2.9, hjust = 0, inherit.aes = FALSE) +
  scale_fill_manual(values = c(
    "Sí — Se tuvo en cuenta" = "#2ECC71",
    "NO SABE" = "#7B68EE",
    "NO — No se tuvo en cuenta" = "#E74C3C"
  )) +
  scale_x_continuous(
    breaks = 1:5,
    labels = c("1 Nada\nimportante", "2", "3", "4", "5 Muy\nimportante"),
    limits = c(0.5, 5.8)
  ) +
  labs(
    title = "¿Quiénes creen que se ignoró a los vecinos también desconfían de la coordinación institucional?",
    subtitle = paste0("Distribución de la importancia atribuida a la coordinación Ayuntamiento–Junta (P4)\n",
                      "según percepción de participación vecinal en nuevos proyectos (P5) · n = 225"),
    x = "Valoración de la coordinación Ayuntamiento–Junta · Escala Likert 1–5",
    y = NULL,
    caption = paste0("Elaboración propia · Encuesta 'Parques y Bienestar en Mairena del Aljarafe' (n=225) · TFG Antropología Social y Cultural\n",
                     "Línea blanca = mediana del grupo · Marcas inferiores = observaciones individuales")
  ) +
  theme_ridges(grid = TRUE) +
  theme(
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    plot.title = element_text(face = "bold", size = 13, color = "#1a1a1a", lineheight = 1.2, margin = margin(b = 4)),
    plot.subtitle = element_text(size = 9.5, color = "#444444", lineheight = 1.3, margin = margin(b = 15)),
    plot.caption = element_text(size = 7.5, color = "#777777", hjust = 0, margin = margin(t = 12)),
    axis.text.y = element_text(face = "bold", size = 11, color = "#1a1a1a"),
    axis.text.x = element_text(size = 9, color = "#555555"),
    axis.title.x = element_text(size = 9, color = "#555555", margin = margin(t = 10)),
    panel.grid.major.x = element_line(color = "#e5e5e5", linewidth = 0.4),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    plot.margin = margin(20, 30, 15, 20)
  )
