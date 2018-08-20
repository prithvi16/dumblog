class AddStack < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :stackoverflow, :string
  end
end
