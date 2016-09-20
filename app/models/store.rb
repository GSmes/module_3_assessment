class Store < OpenStruct
  def self.find(zip)
    stores = service.find_stores(zip)

    stores.map do |store|
      Store.new(store)
    end
  end

  def self.service
    BestBuyService.new
  end
end
