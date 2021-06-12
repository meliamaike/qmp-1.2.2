class Guardarropa < ApplicationRecord

      has_many :prendas

      has_many :atuendos

      belongs_to :user

# esto lo hago para poder traerme las categorias del prenda tipo
  def prendas_cabeza
    self.prendas.select{|p| p.prenda_tipo.categoria=="cabeza"}
  end

  def prendas_torso
  self.prendas.select{|p| p.prenda_tipo.categoria=="torso"}

  end

  def prendas_piernas
    self.prendas.select{|p| p.prenda_tipo.categoria=="piernas"}
  end
  def prendas_pies
    self.prendas.select{|p| p.prenda_tipo.categoria=="pies"}
  end

end
