class Addblognametouser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :blog_name, :string , default: "blogname"
  end
end
