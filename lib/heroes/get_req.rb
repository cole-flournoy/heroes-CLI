class Heroes::GetReq

    def initialize(url)
        @url = url
    end 

    def json_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

    def scrape_index
        html = open(@url)
        doc = Nokogiri::HTML(html)

        characters = doc.css("table.table.table-striped.table-info.text-center").text.strip.split("\n")
        characters.collect!{ |chr| chr.strip}
        characters.reject!{|entry| entry == "#ID" || entry == "Chracter Name" || entry == ""}
        characters.each_slice(2).to_a
    end


end