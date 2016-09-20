class BestBuyService
  def initialize
    @connection = Faraday.new('https://api.bestbuy.com/')
  end

  def find_stores(zip)
    response = connection.get do |req|
      req.url "v1/stores(area(#{zip},25))"
      req.params['format']   = 'json'
      req.params['apiKey']   = ENV['BEST_BUY_API_KEY']
      req.params['show']     = 'longName,city,distance,phone,storeType,storeId'
      req.params['pageSize'] = '15'
    end
    pr = parse(response)
    binding.pry
  end

  private

  attr_reader :connection

  def parse(response)
    JSON.parse(response.body)
  end
end
