class ProductDetail < ApplicationRecord
		# associations
		belongs_to :item, polymorphic: true
		mount_uploader :image, ProductImageUploader

# validations
validates_presence_of :desc, :price, :discounted_price
end
