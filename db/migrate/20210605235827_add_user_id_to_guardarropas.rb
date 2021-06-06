class AddUserIdToGuardarropas < ActiveRecord::Migration[6.0]
  def change
    add_reference :guardarropas, :user
  end
end
