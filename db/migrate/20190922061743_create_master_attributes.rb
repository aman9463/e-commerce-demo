class CreateMasterAttributes < ActiveRecord::Migration[5.2]
	def change
		create_table :master_attributes do |t|
			t.string :name, null: false, uniq: true
			t.string :default_name, null: false, uniq: true
			t.index :name, unique: true
			t.index :default_name, unique: true
			t.timestamps
		end
	end
end
