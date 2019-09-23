class CreateProductDetails < ActiveRecord::Migration[5.2]
	def change
		create_table :product_details do |t|
			t.text :desc
			t.string :image
			t.string :price
			t.string :discounted_price
			t.references :item, polymorphic: true, index: true
			t.timestamps
		end
	end
end
