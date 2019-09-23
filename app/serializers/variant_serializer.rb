class VariantSerializer < ActiveModel::Serializer
	attr_accessor :obejct, :action_name

	def initialize(active_record, options=nil)
		@object = active_record
		if options.present?
			@action_name = options[:action_name]
		end
	end
	attributes :product_variant_id,:product_name, :description, :image_url, :in_stock, :storage_type, :color, :price, :discounted_price
	# product_details


	def attributes(*args)
		if action_name == "show"
			hash = object.product.as_json(except: [:created_at, :updated_at])
			hash[:variant] = object.as_json(only: [:id, :in_stock])
			hash[:variant][:storage] = storage_type
			hash[:variant][:color] = color
			hash[:variant][:description] = description
			hash[:variant][:image_url] = image_url
			hash[:variant][:price] = price
			hash[:variant][:discounted_price] = discounted_price

		else
			hash = super
		end
		hash
	end

	def product_variant_id
		object.id
	end

	def product_name
		object.product.name
	end

	def description
		desc = object.description
		if desc.present?
			desc
		else
			object.product.description
		end
	end

	def image_url
		image = object.image
		if image.present?
			image.url
		else
			object.product.image.url
		end
	end

	def price
		price = object.price
		if price.present?
			price
		else
			object.product.price
		end
	end

	def discounted_price
		discounted_price = object.discounted_price
		if discounted_price.present?
			discounted_price
		else
			object.product.discounted_price
		end
	end

	def storage_type
		object.master_storage.name
	end

	def color
		object.master_color.name
	end

	def product_details
		object.variant_detail.as_json(except: [:created_at, :updated_at])
	end


end

