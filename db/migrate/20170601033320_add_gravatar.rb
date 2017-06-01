class AddGravatar < ActiveRecord::Migration[5.0]
  def change

  add_column :users, :gravatar, :boolean , :default => false

  end
end
