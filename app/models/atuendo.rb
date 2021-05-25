class Atuendo < ApplicationRecord

  belongs_to :torso, class_name: "Prenda", required:false
  belongs_to :pies, class_name: "Prenda", required:false
  belongs_to :cabeza, class_name: "Prenda", required:false
  belongs_to :piernas, class_name: "Prenda", required:false
  belongs_to :guardarropa, required:true

  enum estacion_tag: [:verano, :invierno, :primavera, :otonio]
  enum tiempo_tag: [:dia, :noche]
  enum ocasion_tag: [:formal, :informal]


end
