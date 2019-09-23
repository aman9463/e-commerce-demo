module CommonConcern
	def get_master_attribute_id(type, value)
		value = value.split(',')
		case type
		when 'storage'
			attr_id = MasterStorage.all.where('default_name IN (?)', value)
			return [:storage_id, attr_id.ids]
		when 'color'
					attr_id = MasterColor.all.where('default_name IN (?)', value)
			return [:color_id, attr_id.ids]
		end
	end
end