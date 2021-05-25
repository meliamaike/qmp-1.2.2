class CreatePrendas < ActiveRecord::Migration[6.0]
  def change
    create_table :prendas do |t|

      # Estos son porque Prenda pertence a Penda_tipo
      #Y Prenda_tipo tiene categoria y tipo

      t.integer :categoria
      t.integer :tipo
      t.integer :material
      t.integer :color_primario
      t.integer :color_secundario
      t.text :descripcion

      t.timestamps
    end
  end
end
