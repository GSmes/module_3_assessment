class Store < OpenStruct
  def self.find_all(zip)
    stores = service.find_stores(zip)

    stores.map do |store|
      Store.new(store)
    end
  end

  def self.find(id)
    store = service.find_store(id)
    Store.new(store.first)
  end

  def self.service
    BestBuyService.new
  end
end
