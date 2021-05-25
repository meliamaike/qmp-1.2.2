class AddNombreAtuendo < ActiveRecord::Migration[6.0]
  def change
    add_column :atuendos, :nombre, :string

  end
end
