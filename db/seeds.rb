MasterAttribute.destroy_all
MasterAttribute.create(id: 1, name: "Storage", default_name: "storage").tap do |attribute|
	[['64GB', '64gb'],['128GB', '128gb'],  ['256GB', '256gb']].each do |values|
		attribute.storages.create!(name: values[0], default_name: values[1])
	end
end

MasterAttribute.create(id: 2, name: "Color", default_name: "color").tap do |attribute|
	[['Red', 'red'],['Blue', 'blue'],  ['Orange', 'orange']].each do |values|
		attribute.colors.create!(name: values[0], default_name: values[1])
	end
end
all_storage_attributes = MasterAttribute.find_values('storage')
all_color_attributes = MasterAttribute.find_values('color')

Product.destroy_all

product = Product.create(name: "Iphone X").tap do |pr|
	pr.create_product_detail(	
		desc: "Meet the iPhone X - the device that's so smart that it responds to a tap, your voice, and even a glance. Elegantly designed with a large 14.73 cm (5.8) Super Retina screen and a durable front-and-back glass, this smartphone is designed to impress. What's more, you can charge this iPhone wirelessly.",
		image:  File.open(Dir.glob("public/images/iphone.jpeg")[0]),
		price: "80500",
		discounted_price: "7000"
		)
	all_storage_attributes.each do |storage_type|
		all_color_attributes.each do |color_type|
			pr.variants.create!(storage_id: storage_type.id, color_id: color_type.id)
		end
	end
end

Variant.last.create_variant_detail(
	desc: "Meet the iPhone X - the device that's so smart that it responds to a tap, your voice, and even a glance. Elegantly designed with a large 14.73 cm (5.8) Super Retina screen and a durable front-and-back glass, this smartphone is designed to impress. What's more, you can charge this iPhone wirelessly.",
	image: '',
	price: "80500",
	discounted_price: "7000"
	)


product = Product.create(name: "Micro USB Cable").tap do |pr|
	pr.create_product_detail(	
		desc: "Fast Charging and Sync - 2.1A rapid Charge and sync simultaneously at a quick speed. Adapter connector with Micro USB cable ports Tough and Sleek - Durable nylon braided design with premium metal housing and toughened nylon fibre wound tightly around the cord lending it superior durability Superior Quality - Heat-resistant connectors ensure complete safety and durability Wide compatibility - Compatible with any charging adaptor, multi-port charging station or power bank",
		image:  File.open(Dir.glob("public/images/usb.jpeg")[0]),
		price: "199",
		discounted_price: '109')
end
	