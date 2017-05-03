class AddParentComment < ActiveRecord::Migration[5.0]
  def change
     add_column :notifications, :parentcomment_id, :integer 
  end
end
