
PrendaTipo.create(categoria: 0, tipo:  0)
PrendaTipo.create(categoria: 0, tipo:  1)
PrendaTipo.create(categoria: 1, tipo: 10)
PrendaTipo.create(categoria: 1, tipo: 11)
PrendaTipo.create(categoria: 1, tipo: 12)
PrendaTipo.create(categoria: 1, tipo: 13)
PrendaTipo.create(categoria: 1, tipo: 14)
PrendaTipo.create(categoria: 1, tipo: 15)
PrendaTipo.create(categoria: 1, tipo: 16)
PrendaTipo.create(categoria: 1, tipo:  2)
PrendaTipo.create(categoria: 1, tipo:  3)
PrendaTipo.create(categoria: 1, tipo:  4)
PrendaTipo.create(categoria: 2, tipo: 17)
PrendaTipo.create(categoria: 2, tipo: 18)
PrendaTipo.create(categoria: 2, tipo: 19)
PrendaTipo.create(categoria: 2, tipo: 20)
PrendaTipo.create(categoria: 2, tipo:  5)
PrendaTipo.create(categoria: 3, tipo:  6)
PrendaTipo.create(categoria: 3, tipo:  7)
PrendaTipo.create(categoria: 3, tipo:  8)
PrendaTipo.create(categoria: 3, tipo:  9)
PrendaTipo.create(categoria: 3, tipo: 21)
PrendaTipo.create(categoria: 3, tipo: 22)

vintage=Guardarropa.create! nombre: "Estilo vintage"
lluvia=Guardarropa.create! nombre: "Dia de lluvia"
playa=Guardarropa.create! nombre: "playa"

remera=Prenda.create! descripcion: "remera para dormir", material: :algodon, color_primario: "#CCA9DD",color_secundario: "#F9EAC3", guardarropa_id: 1, prenda_tipo_id: 1
pantalon=Prenda.create! descripcion: "pantalon para dormir", material: :lino, color_primario: "#F9EAC3", color_secundario: "#CCA9DD", guardarropa_id: 1, prenda_tipo_id: 1
# pollera=Prenda.create! tipo: :pollera, material: :seda, color_primario: :azul, color_secundario: :naranja
# camisa=Prenda.create! tipo: :camisa, material: :poliester, color_primario: :amarillo
zapatillas=Prenda.create! descripcion: "vans black", color_primario: :negro, guardarropa_id: 1, prenda_tipo_id: 1
sombrero=Prenda.create! descripcion: "gorro piluso", color_primario: :beige, guardarropa_id: 1, prenda_tipo_id: 1




# playa.prendas << sombrero
lluvia.prendas << pantalon
# vintage.prendas << camisa
# vintage.prendas << zapatillas
lluvia.prendas << remera
# vintage.prendas << pollera


