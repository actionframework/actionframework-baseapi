require 'rack'
module ActionFramework
	class BaseAPI
		def initialize
				api_init
		end
		
		class << self
			attr_accessor :config,:routes

			def config key,value
				@config[key] = value
			end	

			def api_init
				@routes = {}
				@config = {}
			end

			def api suffix,method
				if(@config[:json] == true)
					prefix = "/json/"
				end
				@routes[method] = prefix+(suffix.to_s.gsub("_","/"))
			end

			def call env
				@request = Rack::Request.new env
				@response = Rack::Response.new

				if(@routes[@request.method].nil?)
					@response.write "404 Not Found"
					return @response.finish
				end
				methodname = @routes[method].split("/")
				response = self.send(methodname[methodname.length-1])
				if(@config[:json] == true)
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
end