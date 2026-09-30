# Genera los datos simulados para el ejercicio final (03_EjercicioFinal_Ecologia.Rmd)
# Monitoreo de aves en 12 sitios de tres tipos de hábitat durante 2024.
# Ejecutar una sola vez desde la carpeta script/:  source("00_generar_datos_aves.R")

library(tidyverse)
set.seed(2024)

# ---- Sitios de muestreo ----
sitios <- tibble(
  sitio_id = sprintf("S%02d", 1:12),
  habitat  = rep(c("Bosque conservado", "Bosque secundario", "Pastizal"), each = 4)
) %>%
  mutate(
    altitud_m = round(runif(n(), 1800, 2600)),
    cobertura_dosel_pct = case_when(
      habitat == "Bosque conservado" ~ round(runif(n(), 75, 95)),
      habitat == "Bosque secundario" ~ round(runif(n(), 40, 65)),
      TRUE                           ~ round(runif(n(), 0, 15))
    ),
    dist_poblado_km = case_when(
      habitat == "Bosque conservado" ~ round(runif(n(), 4, 9), 1),
      habitat == "Bosque secundario" ~ round(runif(n(), 1.5, 4), 1),
      TRUE                           ~ round(runif(n(), 0.2, 2), 1)
    )
  )

# ---- Especies: gremio trófico y preferencia de hábitat ----
especies <- tribble(
  ~especie,                    ~gremio,       ~tipo,        ~base,
  "Trogon mexicanus",          "Frugívoro",   "bosque",     1.5,
  "Aulacorhynchus prasinus",   "Frugívoro",   "bosque",     1.2,
  "Myadestes occidentalis",    "Frugívoro",   "bosque",     2.5,
  "Henicorhina leucophrys",    "Insectívoro", "bosque",     2.5,
  "Basileuterus rufifrons",    "Insectívoro", "bosque",     2.0,
  "Catharus aurantiirostris",  "Insectívoro", "bosque",     1.8,
  "Hylocharis leucotis",       "Nectarívoro", "bosque",     2.0,
  "Momotus lessonii",          "Omnívoro",    "bosque",     1.0,
  "Turdus grayi",              "Omnívoro",    "generalista",3.0,
  "Melanerpes aurifrons",      "Omnívoro",    "generalista",1.8,
  "Pitangus sulphuratus",      "Insectívoro", "generalista",2.0,
  "Psaltriparus minimus",      "Insectívoro", "generalista",3.5,
  "Cynanthus latirostris",     "Nectarívoro", "generalista",1.5,
  "Cathartes aura",            "Carroñero",   "generalista",1.0,
  "Setophaga coronata",        "Insectívoro", "migratoria", 4.0,
  "Quiscalus mexicanus",       "Omnívoro",    "abierto",    4.0,
  "Columbina inca",            "Granívoro",   "abierto",    3.0,
  "Zenaida asiatica",          "Granívoro",   "abierto",    2.5,
  "Sporophila torqueola",      "Granívoro",   "abierto",    2.5,
  "Passer domesticus",         "Granívoro",   "abierto",    2.0,
  "Sturnella magna",           "Insectívoro", "abierto",    1.5,
  "Tyrannus melancholicus",    "Insectívoro", "abierto",    1.5
)

pref <- tribble(
  ~tipo,         ~`Bosque conservado`, ~`Bosque secundario`, ~Pastizal,
  "bosque",      3.0,                  1.2,                  0.05,
  "generalista", 1.2,                  1.8,                  1.2,
  "migratoria",  1.0,                  1.5,                  1.0,
  "abierto",     0.05,                 0.8,                  3.0
) %>%
  pivot_longer(-tipo, names_to = "habitat", values_to = "pref")

# ---- Clima: precipitación mensual (mm) por sitio, formato ancho ----
precip_media <- c(10, 8, 12, 25, 60, 180, 210, 200, 170, 70, 15, 8)
clima_long <- expand_grid(sitio_id = sitios$sitio_id, mes = 1:12) %>%
  mutate(precip_mm = round(precip_media[mes] * runif(n(), 0.7, 1.3)))

clima_wide <- clima_long %>%
  mutate(mes = sprintf("mes_%02d", mes)) %>%
  pivot_wider(names_from = mes, values_from = precip_mm)

# ---- Conteos por punto ----
visitas <- tibble(fecha = as.Date(c("2024-01-18", "2024-03-14", "2024-05-16",
                                    "2024-07-18", "2024-09-19", "2024-11-14")))
observadores <- c("Ana López", "Carlos Ruiz", "Marta Gómez")

# cada sitio se visita en días ligeramente distintos dentro de la misma semana
visitas_sitio <- expand_grid(sitios %>% select(sitio_id, habitat), visitas) %>%
  mutate(fecha = fecha + sample(0:6, n(), replace = TRUE))

conteos <- expand_grid(visitas_sitio,
                       especies %>% select(especie, tipo, base)) %>%
  left_join(pref, by = c("tipo", "habitat")) %>%
  mutate(mes = month(fecha),
         temporada = if_else(mes %in% 6:10, 1.3, 0.9),       # más actividad en lluvias
         migra = if_else(tipo == "migratoria" & !mes %in% c(1, 3, 11), 0, 1),
         lambda = base * pref * temporada * migra,
         abundancia = rpois(n(), lambda)) %>%
  filter(abundancia > 0)

# un observador por sitio y visita
obs_visita <- conteos %>%
  distinct(sitio_id, fecha) %>%
  mutate(observador  = sample(observadores, n(), replace = TRUE),
         hora_inicio = sprintf("%02d:%02d", sample(6:8, n(), TRUE), sample(c(0, 15, 30, 45), n(), TRUE)))

conteos <- conteos %>%
  left_join(obs_visita, by = c("sitio_id", "fecha")) %>%
  left_join(especies %>% select(especie, gremio), by = "especie") %>%
  select(sitio_id, fecha, hora_inicio, observador, especie, gremio, abundancia) %>%
  arrange(sitio_id, fecha, especie)

# Registros con abundancia no anotada (NA), como en una libreta de campo real
conteos$abundancia[sample(nrow(conteos), 15)] <- NA

# ---- Exportar ----
write_csv(conteos,    "../data/aves_conteos.csv")
write_csv(sitios,     "../data/aves_sitios.csv")
write_csv(clima_wide, "../data/aves_clima_wide.csv")
