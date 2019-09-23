class MasterAttributeValue < ApplicationRecord
	# associaton
	belongs_to :master_attribute
	has_many :variants, foreign_key: 'attribute_value_id', dependent: :destroy


# validations
  validates_presence_of :name, :default_name
  
end 
