########################
## Licensed under MIT ##
#### © BramVDB.com #####
########################

require './../lib/actionframework/baseapi'

class MyAPI < ActionFramework::BaseAPI
	config :json, :true

	# GET /status
	api :status, :get
	def status
		{:status => "ok"}
	end

	# POST /photos/create
	api :photos_create, :post
	def photos_create
		{:status => "created"}
	end

	# DELETE /photos/delete
	api :photos_delete, :delete
	def photos_delete
		{:status => "photos deleted"}
	end

end

run MyAPI.new
