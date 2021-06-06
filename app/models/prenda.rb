class Prenda < ApplicationRecord


  belongs_to :prenda_tipo

  belongs_to :guardarropa

  enum material: [:algodon, :lino, :poliester, :seda, :denim, :cuero]

  has_one_attached :imagen

  # validates :descripcion, format: {with:/\A[a-zA-Z]+\z/, message: "Solo se admiten letras"}

end
