class ProductSerializer < ActiveModel::Serializer
	attr_accessor :obejct, :attr_ids

	def initialize(active_record, options=nil)
		@object = active_record
		if options.present?
			@attr_ids = options[:attr_ids]
		end
	end


	attributes :id, :name, :in_stock
	attributes :variants

	def variants
		if @attr_ids.present?
			variants = object.variants.where(@attr_ids[0][0]=> @attr_ids[0][1])
			variants.map do |variant|
				::VariantSerializer.new(variant)
			end
		elsif object.variants.present?
			object.variants.map do |variant|
				::VariantSerializer.new(variant)
			end
		else
			object.product_detail.as_json(except: [:created_at, :updated_at])
		end
	end

end
