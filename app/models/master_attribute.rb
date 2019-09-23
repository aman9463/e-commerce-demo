class MasterAttribute < ApplicationRecord
	# association
	has_many :storages, class_name: 'MasterStorage', foreign_key: 'master_attribute_id', dependent: :destroy
	has_many :colors, class_name: 'MasterColor', dependent: :destroy

	
# validations
validates_presence_of :name, :default_name

	# custom mehtods
	def self.find_values(type)
		case type
		when 'storage'
			self.find_by(default_name: type).storages
		when 'color'
			self.find_by(default_name: type).colors
		end
	end

end
