class PrendaTipo < ApplicationRecord

  has_one :prenda

  # enum tipo: [:gorro, :pantalon, :remera, :zapatillas]
  enum categoria: [:cabeza, :torso, :piernas, :pies]

  enum tipo: [:gorro, :sombrero, :remera, :buzo, :campera, :jogging, :zapatos, :zapatillas, :ojotas, :sandalias, :chomba, :camisa, :suéter, :polera, :chaleco, :musculosa,
               :vestido, :pollera, :jean, :short, :bermuda, :tacones, :crocs ]



end
