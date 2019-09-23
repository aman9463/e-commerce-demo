Rails.application.routes.draw do
	scope module: :api, defaults: {format: 'json'} do
		get '/lists' => 'products#lists'
		get '/details/:id' => 'products#details'
	end
end
