class AddSubdomainToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :subdomain, :string
  end
  add_index :users, :subdomain, unique: true
end
