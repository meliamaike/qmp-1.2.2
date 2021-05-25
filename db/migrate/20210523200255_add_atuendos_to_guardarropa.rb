class AddAtuendosToGuardarropa < ActiveRecord::Migration[6.0]
  def change
    add_reference :atuendos, :guardarropa
  end
end
