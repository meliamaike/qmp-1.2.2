PrendaTipo.create categoria: :cabeza, tipo: :gorro
PrendaTipo.create categoria: :piernas, tipo: :pantalon
PrendaTipo.create categoria: :torso, tipo: :remera
PrendaTipo.create categoria: :pies, tipo: :zapatillas

vintage=Guardarropa.create! nombre: "Estilo vintage"
lluvia=Guardarropa.create! nombre: "Dia de lluvia"
playa=Guardarropa.create! nombre: "playa"

remera=Prenda.create! descripcion: "remera para dormir", material: :algodon, color_primario: "#CCA9DD",color_secundario: "#F9EAC3", guardarropa_id: 1, prenda_tipo_id: 1
pantalon=Prenda.create! descripcion: "pantalon para dormir", material: :lino, color_primario: "#F9EAC3", color_secundario: "#CCA9DD", guardarropa_id: 1, prenda_tipo_id: 1
# pollera=Prenda.create! tipo: :pollera, material: :seda, color_primario: :azul, color_secundario: :naranja
# camisa=Prenda.create! tipo: :camisa, material: :poliester, color_primario: :amarillo
zapatillas=Prenda.create! descripcion: "vans black", color_primario: :negro, guardarropa_id: 1, prenda_tipo_id: 1
sombrero=Prenda.create! descripcion: "gorro piluso", color_primario: :beige, guardarropa_id: 1, prenda_tipo_id: 1



# remera.prenda_tipo << p3
# pantalon.prenda_tipo << p2
# sombrero.prenda_tipo << p1
# zapatillas.prenda_tipo << p4


# playa.prendas << sombrero
lluvia.prendas << pantalon
# vintage.prendas << camisa
# vintage.prendas << zapatillas
lluvia.prendas << remera
# vintage.prendas << pollera



# atuendo_1=Atuendo.create! torso_id:1, cabeza_id:1, piernas_id:1, pies_id:1, puntaje: 1, estacion_tag:1, tiempo_tag:1, ocasion_tag:1, guardarropa_id:1, nombre: "pruebita lm"
#
# vintage.atuendos << atuendo_1