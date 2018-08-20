class Addtwitterandgithub < ActiveRecord::Migration[5.0]
  def change
    
    add_column :users, :github, :string
    add_column :users, :twitter , :string
  end
end
