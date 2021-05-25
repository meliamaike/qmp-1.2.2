class ChangePrendas < ActiveRecord::Migration[6.0]
  def change
    remove_column :prendas, :tipo, :integer

  end
end
