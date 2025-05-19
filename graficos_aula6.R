# AULA 6 — GRÁFICOS: GASTO PÚBLICO EM SAÚDE (% DO PIB)

# Instalar e carregar os pacotes
# install.packages("WDI")
# install.packages("tidyverse")
library(WDI)
library(tidyverse)

# Ajustar para não exibir notação científica
options(scipen = 999)

# -----------------------------------------------------------
# BUSCAR DADOS

# 1. DADOS EM PAINEL (2015–2024) — 4 países com maiores gastos
dadospainel <- WDI(
  country = c("USA", "FRA", "DEU", "AUT"), # Estados Unidos, França, Alemanha, Áustria
  indicator = "SH.XPD.CHEX.GD.ZS",
  start = 2015, end = 2024
)

# 2. CORTE TRANSVERSAL (somente 2020) — mesmos 4 países
dadostransversal <- WDI(
  country = c("USA", "FRA", "DEU", "AUT"),
  indicator = "SH.XPD.CHEX.GD.ZS",
  start = 2020, end = 2020
)

# 3. SÉRIE TEMPORAL — apenas Brasil (2015–2024)
dadosbrasil <- WDI(
  country = "BR",
  indicator = "SH.XPD.CHEX.GD.ZS",
  start = 2015, end = 2024
)

# -----------------------------------------------------------
# CRIAR GRÁFICOS

# Gráfico 1 — Painel: 4 países, 2015–2024
grafpainel <- ggplot(dadospainel, aes(x = year, y = SH.XPD.CHEX.GD.ZS, color = country)) +
  geom_line(size = 1) +
  labs(
    title = "Gasto Público em Saúde (% do PIB): 4 Países (2015–2024)",
    x = "Ano", y = "Gasto Público em Saúde (% PIB)", color = "País"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Gráfico 2 — Corte transversal: 4 países em 2020
grafcorte <- ggplot(dadostransversal, aes(x = country, y = SH.XPD.CHEX.GD.ZS, fill = country)) +
  geom_col() +
  labs(
    title = "Gasto Público em Saúde (% do PIB) — 2020",
    x = "País", y = "Gasto Público em Saúde (% PIB)", fill = "País"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Gráfico 3 — Série temporal: Brasil (2015–2024)
grafserie <- ggplot(dadosbrasil, aes(x = year, y = SH.XPD.CHEX.GD.ZS)) +
  geom_line(color = "darkgreen", size = 1.2) +
  geom_point(color = "darkgreen", size = 2) +
  labs(
    title = "Gasto Público em Saúde (% do PIB) — Brasil (2015–2024)",
    x = "Ano", y = "Gasto Público em Saúde (% PIB)"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# -----------------------------------------------------------
# EXIBIR GRÁFICOS
print(grafpainel)
print(grafcorte)
print(grafserie)