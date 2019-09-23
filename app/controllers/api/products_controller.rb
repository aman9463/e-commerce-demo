class Api::ProductsController < ApplicationController
	include CustomExceptionHandler
	include CommonConcern
	
	def lists
		if params[:search].present?
			products = Product.where("name LIKE :name", name: "%#{params[:search]}%")
			if params[:filter].present?
				attr_ids = filter_products
			else
				attr_ids =[]
			end
			render json: products, attr_ids: attr_ids
		else
			@products = Product.all.paginate(page: params[:page] || 1, per_page: 10)
			not_variant_pr =  Product.joins("INNER JOIN variants ON variants.product_id != products.id").uniq
			new_hash = not_variant_pr.map{|pr|
				hash = pr.as_json
				hash[:product_id]  = pr.id
				hash[:product_name]  = 'ds'
				hash
			}
			puts new_hash
			
			render json: @products, action_name: "lists"
		end
	end

	def filter_products
		attr_id = []
		if params[:filter][:storage].present?
			attr_id << get_master_attribute_id('storage',params[:filter][:storage])
		end
		if params[:filter][:color].present?
			attr_id << get_master_attribute_id('color',params[:filter][:color])
		end
		attr_id
	end

	def details
		@variant = Variant.where(id: params[:id]).last
		render json: @variant, action_name: "show"
	end

end
