########################
## Licensed under MIT ##
#### © BramVDB.com #####
########################

# Keeping this as a reference for a while, will get removed very quickly

require 'rack'
module ActionFramework
	class BaseAPI
		@@config = {}
		@@routes = {}

		def initialize
				api_init
		end

		def self.config key,value
			@@config[key] = value
		end

		def api_init
			@@config = {}
		end

		def self.api suffix,method
			prefix = ""
			if(@@config[:json] == true)
				prefix = "/json/"
			end
			@@routes[method] = prefix+(suffix.to_s.gsub("_","/"))
			p @@routes
		end

		def call env
			@request = Rack::Request.new env
			@response = Rack::Response.new

			p @@routes
			if(@@routes[@request.request_method] == @request.path)
				@response.write "404 Not Found"
				return @response.finish
			end
			methodname = @@routes[@request.request_method].split("/")
			response = self.send(methodname[methodname.length-1])
			if(@@config[:json] == true)
				response = response.to_json
			end
			@response.write response
			@response.finish
		end

		def params
			@request.params
		end
	end
end
