
library(arrow)
library(tidyverse)

# Lendo o arquivo Parquet
df <- read_parquet("dataset.parquet")

# Visualizando os dados
head(df)


var <- c("COD_NOTI", "NM_PACIENTE", "NM_MAE", "DT_NASCI")


dados <- df %>% select(all_of(var))


dados$NM_PACIENTE <- corrigir_codificacao(dados$NM_PACIENTE, encoding = "latin1")

dados$NM_MAE <- corrigir_codificacao(dados$NM_MAE, encoding = "latin1")

dados$NM_MAE <- iconv(dados$NM_MAE, from = "latin1", to = "ASCII//TRANSLIT")

dados$NM_PACIENTE <- iconv(dados$NM_PACIENTE, from = "latin1", to = "ASCII//TRANSLIT")

write.csv2(dados, file = 'dados_splink_test.csv', row.names = F)
