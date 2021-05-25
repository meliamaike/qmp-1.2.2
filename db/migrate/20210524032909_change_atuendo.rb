class ChangeAtuendo < ActiveRecord::Migration[6.0]
  def change
    add_column :atuendos, :estacion_tag, :integer
    add_column :atuendos, :tiempo_tag, :integer
    add_column :atuendos, :ocasion_tag, :integer
    add_column :atuendos, :descripcion, :text
    remove_column :atuendos, :etiquetas, :string
  end
end
