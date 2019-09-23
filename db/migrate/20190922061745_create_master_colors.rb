class CreateMasterColors < ActiveRecord::Migration[5.2]
	def change
		create_table :master_colors do |t|
			t.references :master_attribute, foreign_key: true, index: true
			t.string :name, null: false, uniq: true
			t.string :default_name, null: false, uniq: true
			t.index :name, unique: true
			t.index :default_name, unique: true
			t.timestamps
		end
	end
end
