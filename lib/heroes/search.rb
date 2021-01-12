class Heroes::Search
    ## Add your authentication token from 'https://superheroapi.com/index.html' in a new env file
    
    AUTHENTICATION = ENV["TOKEN"]
    BASE_PATH = "https://www.superheroapi.com/api.php/#{AUTHENTICATION}/"

    def self.by_id(id)
        url = BASE_PATH + "#{id}/"
        Heroes::GetReq.new(url).json_response_body
    end

    def self.by_name(user_input)
        url = BASE_PATH + "search/#{user_input}"
        Heroes::GetReq.new(url).json_response_body
    end
 
end