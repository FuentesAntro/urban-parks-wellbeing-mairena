# Urban Parks & Wellbeing in Mairena del Aljarafe

**Citizen Perception Study (2026)** | Anthropology Meets Data Science

![Status](https://img.shields.io/badge/Status-Completed-success)
![R](https://img.shields.io/badge/R-4.3+-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 📋 Project Overview

This repository contains the **data analysis** of the survey *"Parques y Bienestar en Mairena del Aljarafe"* (n=225), conducted as part of my Bachelor's Thesis in Social and Cultural Anthropology with a strong data science component.

The study explores how citizens perceive and use urban green spaces, their priorities for improvement, and the relationship between perceived institutional coordination and citizen participation.

### 🎯 Research Objectives
- Identify main motivations for visiting urban parks
- Analyze citizen priorities for urban management
- Evaluate perceived institutional coordination (Ayuntamiento-Junta)
- Explore the relationship between feeling heard and trust in institutions

## 📊 Key Visualizations

### Urban Quality Priorities (2026)
![Percepción de Calidad Urbana](images/GRÁFICA_6.png)

### Main Motivations for Park Visits
![Motivos de visita](images/GRÁFICA_7_R.png)

### Most Used Green Spaces
![Espacio verde más frecuentado](images/GRÁFICA_4.png)

### Institutional Coordination & Participation
![Coordinación institucional](images/GRÁFICA_4-5_R.png)

## 🛠️ Methodology & Tools

- **Software**: R (tidyverse, ggplot2, ggsankey, patchwork, etc.)
- **Survey Platform**: Custom survey (Likert scales + multiple choice)
- **Analysis**: Descriptive statistics, Likert visualization, Sankey diagrams, co-occurrence analysis (ATLAS.ti + R)
- **Qualitative Integration**: Mixed-methods approach combining survey data with in-depth interviews

## 📁 Repository Structure

```bash
urban-parks-wellbeing-mairena/
├── README.md
├── data/
│   └── raw/              # (Not public - contains personal data)
│   └── processed/
├── scripts/
│   ├── 01_data_cleaning.R
│   ├── 02_descriptive_analysis.R
│   ├── 03_visualizations.R
│   └── 04_mixed_methods.R
├── images/               # All plots used in thesis
├── outputs/
├── docs/
│   └── thesis_summary.pdf
└── renv/                 # Reproducible environment
