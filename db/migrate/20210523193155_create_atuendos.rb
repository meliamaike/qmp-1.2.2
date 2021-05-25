class CreateAtuendos < ActiveRecord::Migration[6.0]
  def change

    create_table :atuendos do |t|
      t.references :torso
      t.references :cabeza
      t.references :piernas
      t.references :pies

    end

    add_column :atuendos, :puntaje , :integer
    add_column :atuendos, :etiquetas , :string


  end
end
