class AddGuardarropaIdToPrenda < ActiveRecord::Migration[6.0]
  def change
    add_reference :prendas, :guardarropa
  end
end
