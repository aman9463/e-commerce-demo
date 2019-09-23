class Variant < ApplicationRecord
		# associations
		has_one :variant_detail, dependent: :destroy, as: :item, class_name: 'ProductDetail'
		belongs_to :product
		belongs_to :master_storage, foreign_key: 'storage_id'
		belongs_to :master_color, foreign_key: 'color_id'

	# belongs_to :master_attribute, class_name: 'MasterAttribute', foreign_key: 'attribute_id', optional: true
	# belongs_to :master_attribute_value, class_name: 'MasterAttributeValue', foreign_key: 'attribute_value_id', optional: true
	# has_many :colors, class_name: 'Variant', foreign_key: 'color_id'
	# belongs_to :main_category, class_name: 'MenuCategory', foreign_key: 'sub_category_id', optional: true

	# scope :colors, -> {where (self.)}
	def description
		variant_detail.try(:desc)
	end
	def image
		variant_detail.try(:image)
	end

	def price
		variant_detail.try(:price)
	end
	def discounted_price
		variant_detail.try(:discounted_price)
	end

end
