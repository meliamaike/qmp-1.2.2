class Prenda < ApplicationRecord


  belongs_to :prenda_tipo

  belongs_to :guardarropa

  enum material: [:algodon, :lino, :poliester, :seda, :denim, :cuero]
  has_one_attached :imagen

end
