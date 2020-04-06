class Search
attr_reader :suburb_input, :postcode, :max_price
    def initialize(suburb, postcode, max_price)
    @suburb = suburb
    @postcode = postcode
    @max_price = max_price
    end
end

