
User.create email: "admin@gmail.com", password: "11111111", created_at: "2000-01-21 21:00", updated_at: "2021-03-21 21:00:32", admin: true
User.create email: "meli@gmail.com", password: "mmmmmmmm", created_at: "2002-02-18 21:00", updated_at: "2021-06-21 21:00:32", admin: false
User.create email: "ej1@gmail.com", password: "mmmmmmmm", created_at: "2002-02-18 21:00", updated_at: "2021-06-21 21:00:32", admin: false
User.create email: "ej2@gmail.com", password: "mmmmmmmm", created_at: "2002-02-18 21:00", updated_at: "2021-06-21 21:00:32", admin: false
User.create email: "ej3@gmail.com", password: "12345678", created_at: "2002-02-18 21:00", updated_at: "2021-06-21 21:00:32", admin: false







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




admin=Guardarropa.create! nombre: "Admin guardarropas" , user_id: 1
vintage=Guardarropa.create! nombre: "Estilo vintage",user_id: 2
lluvia=Guardarropa.create! nombre: "Dia de lluvia",user_id: 2
playa=Guardarropa.create! nombre: "playa",user_id: 2




remera=Prenda.create! descripcion: "remera para dormir", material: :algodon, color_primario: "#CCA9DD",color_secundario: "#F9EAC3", guardarropa_id: 1, prenda_tipo_id: 1, user_id: 2
pantalon=Prenda.create! descripcion: "pantalon para dormir", material: :lino, color_primario: "#F9EAC3", color_secundario: "#CCA9DD", guardarropa_id: 1, prenda_tipo_id: 1, user_id: 2
zapatillas=Prenda.create! descripcion: "vans black", material: :cuero,color_primario: :negro,color_secundario: "#E6EAC3", guardarropa_id: 1, prenda_tipo_id: 1, user_id: 2
sombrero=Prenda.create! descripcion: "gorro piluso", material: :lino,color_primario: :beige,color_secundario: "rosita", guardarropa_id: 1, prenda_tipo_id: 1, user_id: 2




lluvia.prendas << sombrero
lluvia.prendas << pantalon
# vintage.prendas << camisa
lluvia.prendas << zapatillas
lluvia.prendas << remera
# vintage.prendas << pollera


