class Prenda < ApplicationRecord


  belongs_to :prenda_tipo

  belongs_to :guardarropa

  has_one :user, through: :guardarropa

  enum material: [:algodon, :lino, :poliester, :seda, :denim, :cuero]

  has_one_attached :imagen


  validates :material, presence: true
  validates :color_primario, presence: true
  validates :color_secundario, presence: true


end
