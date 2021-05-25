class CreateGuardarropas < ActiveRecord::Migration[6.0]
  def change
    create_table :guardarropas do |t|
      t.text :nombre
    end
  end
end
