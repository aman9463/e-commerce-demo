class CreateProducts < ActiveRecord::Migration[5.2]
	def change
		create_table :products do |t|
			t.string :name, null: false
			t.boolean :in_stock, default: true
			t.timestamps
		end
	end
end
