# AULA 6 - GASTOS COM SAÚDE (% DO PIB)

# CARREGAR OS PACOTES NECESSÁRIOS
library(WDI)         # Pacote para acessar dados do World Bank
library(tidyverse)   # Pacote para gráficos (ggplot2 incluso)

# AJUSTA A NOTAÇÃO CIENTÍFICA
options(scipen = 999)

# -------------------------------
# DADOS EM PAINEL (2015–2024)
# Países mais impactados pela pandemia da COVID-19
# EUA, Brasil, Índia, Rússia, México, Peru
# -------------------------------

dados_painel <- WDI(country = c("US", "BR", "IN", "RU", "MX", "PE"),
                    indicator = 'SH.XPD.CHEX.GD.ZS',
                    start = 2015, end = 2024)

# GRÁFICO PAINEL
grafpainel <- ggplot(dados_painel,
                     mapping = aes(y = SH.XPD.CHEX.GD.ZS,
                                   x = year,
                                   color = country)) +
  geom_line(size = 1.2) +
  labs(title = "Gastos com Saúde (% do PIB) - Painel (2015–2024)",
       subtitle = "Países mais impactados pela pandemia da COVID-19",
       x = "Ano",
       y = "Gasto com saúde (% do PIB)",
       color = "País") +
  theme_minimal()

print(grafpainel)

# -------------------------------
# DADOS DE CORTE TRANSVERSAL (ANO DE 2020)
# Mesmos países
# -------------------------------

dados_transversal <- WDI(country = c("US", "BR", "IN", "RU", "MX", "PE"),
                         indicator = 'SH.XPD.CHEX.GD.ZS',
                         start = 2020, end = 2020)

# GRÁFICO CORTE TRANSVERSAL
grafcorte <- ggplot(dados_transversal,
                    mapping = aes(y = SH.XPD.CHEX.GD.ZS,
                                  x = country,
                                  fill = country)) +
  geom_col() +
  labs(title = "Gastos com Saúde (% do PIB) - Corte Transversal (2020)",
       subtitle = "Países mais impactados pela pandemia da COVID-19",
       x = "País",
       y = "Gasto com saúde (% do PIB)") +
  theme_minimal()

print(grafcorte)

# -------------------------------
# DADOS DE SÉRIE TEMPORAL (BRASIL de 2015 a 2024)
# -------------------------------

dados_serie <- WDI(country = 'BR',
                   indicator = 'SH.XPD.CHEX.GD.ZS',
                   start = 2015, end = 2024)

# GRÁFICO SÉRIE TEMPORAL
grafserie <- ggplot(dados_serie,
                    mapping = aes(y = SH.XPD.CHEX.GD.ZS,
                                  x = year)) +
  geom_line(color = "darkgreen", size = 1.2) +
  labs(title = "Gastos com Saúde (% do PIB) - Brasil (2015–2024)",
       x = "Ano",
       y = "Gasto com saúde (% do PIB)") +
  theme_minimal()

print(grafserie)