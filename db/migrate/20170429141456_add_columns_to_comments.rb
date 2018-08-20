class AddColumnsToComments < ActiveRecord::Migration[5.0]
	def change
		add_column :user ,:post , :references
	end
end
