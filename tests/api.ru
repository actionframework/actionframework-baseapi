require 'actionframework/baseapi'

class MyAPI < ActionFramework::BaseAPI
	config :json, :true

	api :init, :get
	def init
		{:test => "ok"}
	end	
end