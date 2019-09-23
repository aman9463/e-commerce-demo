class MasterStorage < ApplicationRecord
		# associaton
		belongs_to :master_attribute
		
# validations
  validates_presence_of :name, :default_name, :master_attribute_id
	end
