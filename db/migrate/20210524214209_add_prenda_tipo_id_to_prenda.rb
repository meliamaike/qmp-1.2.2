class AddPrendaTipoIdToPrenda < ActiveRecord::Migration[6.0]
  def change

      add_reference :prendas, :prenda_tipo
  end
end
