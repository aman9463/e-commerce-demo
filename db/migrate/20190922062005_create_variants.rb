class CreateVariants < ActiveRecord::Migration[5.2]
	def change
		create_table :variants do |t|
			t.references :product, null: false
			t.references :storage, foreign_key: {to_table: :master_storages}, index: true, null: false
			t.references :color, foreign_key: {to_table: :master_colors}, index: true, null: false
			t.boolean :in_stock, default: true
			t.timestamps
		end
	end
end
