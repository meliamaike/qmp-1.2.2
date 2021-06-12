class Atuendo < ApplicationRecord


  scope :filter_by_estacion, -> (estacion) { where estacion_tag: estacion if estacion }
  scope :filter_by_ocasion, -> (ocasion) { where ocasion_tag: ocasion if ocasion}
  scope :filter_by_tiempo, -> (tiempo) { where tiempo_tag: tiempo if tiempo }
  scope :ordered_by_puntaje, -> (order) { order(puntaje: order) if order }

  belongs_to :torso, class_name: "Prenda", required:false
  belongs_to :pies, class_name: "Prenda", required:false
  belongs_to :cabeza, class_name: "Prenda", required:false
  belongs_to :piernas, class_name: "Prenda", required:false
  belongs_to :guardarropa, required:true

  enum estacion_tag: [:verano, :invierno, :primavera, :otonio]
  enum tiempo_tag: [:dia, :noche]
  enum ocasion_tag: [:formal, :informal]

  validates :estacion_tag, presence: true
  validates :tiempo_tag, presence: true
  validates :ocasion_tag, presence: true
  validates_inclusion_of :puntaje, :in => 0..10, presence:true

  validates :torso_id, presence: true
  validates :piernas_id, presence: true
  validates :pies_id, presence: true
  validates :cabeza_id, presence: true

  has_one :user, through: :guardarropa


end
