class PrendaTipo < ApplicationRecord

  has_one :prenda

  enum tipo: [:gorro, :pantalon, :remera, :zapatillas]
  enum categoria: [:cabeza, :torso, :piernas, :pies]

end
