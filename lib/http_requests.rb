#Wrapper class for http requests
require 'net/http'
require 'json'

class HttpWrapper
    def self.post_json(json_body, url) 
        begin
            uri = URI(url)
            http = Net::HTTP.new(uri.host, uri.port)
            req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json',  
            'Authorization' => 'XXXXXXXXXXXXXXXX'})
            req.body = json_body
            res = http.request(req)
            puts "response #{res.body}"
            puts JSON.parse(res.body)
        rescue => e
            puts "failed #{e}"
        end
    end
end