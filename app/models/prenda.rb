class Prenda < ApplicationRecord


  belongs_to :prenda_tipo

  belongs_to :guardarropa

  enum material: [:algodon, :lino, :poliester, :seda, :denim, :cuero]
  enum color_primario: [:rojo, :amarillo, :azul,:blanco, :negro, :beige ]
  enum color_secundario: [:naranja, :rosa, :violeta,:marron, :gris]

  has_one_attached :imagen

end
