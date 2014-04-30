########################
## Licensed under MIT ##
#### © BramVDB.com #####
########################

require 'json'

module ActionFramework
  class BaseAPI
      @@config = {}
      @@routes = {}

      def self.config(key,value)
        @@config[key] = value
      end

      def self.api(suffix,method)
        array = @@routes[method] || @@routes[method.to_s.upcase] = []
        array << suffix.to_s.gsub("_","/")
      end

      def call env
        @request = Rack::Request.new(env)
        @response = Rack::Response.new

        path = @request.path
        path.slice!(0)

        if(@@routes[@request.request_method].nil? || !@@routes[@request.request_method].include?(path))
          @response.write "404 Not Found"
          @response.status = 404
          return @response.finish
        end

        res = self.send(path.gsub("/","_"))
        if(@@config[:json])
          @response.header["Content-type"] = "application/json"
          res = res.to_json
        end
        @response.write res
        return @response.finish
      end
  end
end
