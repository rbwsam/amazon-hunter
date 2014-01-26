require 'amazon/hunter/version'
require 'amazon/item'

module Amazon
  class Hunter
    def self.lookup(asin)
      Amazon::Item.new
    end
  end
end
