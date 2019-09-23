class Product < ApplicationRecord
		# associations
		has_one  :product_detail, dependent: :destroy, as: :item
		has_many :variants, dependent: :destroy

# validations
validates_presence_of :name

def description
	product_detail.desc
end

def image
	product_detail.try(:image)
end

def price
	product_detail.price
end

def discounted_price
	product_detail.discounted_price
end


end
