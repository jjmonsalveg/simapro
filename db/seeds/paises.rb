
es = Idioma.create!(nombre: 'Español')
en = Idioma.create!(nombre: 'Inglés')
puts '#---- Idiomas  SEEDED ----#'

Pais.create!(nombre: 'Venezuela', idioma: es)
Pais.create!(nombre: 'Estados Unidos', idioma: en)
Pais.create!(nombre: 'España',idioma: es)
puts '#---- Paises  SEEDED ----#'
