class AddUserIdToAtuendos < ActiveRecord::Migration[6.0]
  def change
    add_reference :atuendos, :user
  end
end
