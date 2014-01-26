require 'amazon/hunter/version'
require 'amazon/item'
require 'amazon/ecs'

module Amazon
  class Hunter
    class << self
      attr_accessor :config

      def lookup(asin)
        res = Amazon::Ecs.item_lookup(asin, {:response_group => 'Medium'})
        raw_item = res.items.first

        item = Amazon::Item.new
        item.asin = raw_item.get('ASIN')
        item.sales_rank = raw_item.get('SalesRank')
        item.small_image = raw_item.get_hash('SmallImage')
        item.medium_image = raw_item.get_hash('MediumImage')
        item.large_image = raw_item.get_hash('LargeImage')
        item.product_group = raw_item.get('ItemAttributes/ProductGroup')
        item.title = raw_item.get('ItemAttributes/Title')
        item.brand = raw_item.get('ItemAttributes/Brand')
        item.sku = raw_item.get('ItemAttributes/SKU')
        item.mpn = raw_item.get('ItemAttributes/MPN')
        item.upc = raw_item.get('ItemAttributes/UPC')
        item.upc_list = raw_item.get_array('ItemAttributes/UPCList/*')
        item.part_number = raw_item.get('ItemAttributes/PartNumber')

        height = raw_item.get_element('ItemAttributes/PackageDimensions/Height')
        item.height = {
            :units => height.attributes['Units'].value,
            :value => raw_item.get('ItemAttributes/PackageDimensions/Height')
        }

        weight = raw_item.get_element('ItemAttributes/PackageDimensions/Weight')
        item.weight = {
            :units => weight.attributes['Units'].value,
            :value => raw_item.get('ItemAttributes/PackageDimensions/Weight')
        }
        
        width = raw_item.get_element('ItemAttributes/PackageDimensions/Width')
        item.width = {
            :units => width.attributes['Units'].value,
            :value => raw_item.get('ItemAttributes/PackageDimensions/Width')
        }
        
        length = raw_item.get_element('ItemAttributes/PackageDimensions/Length')
        item.length = {
            :units => length.attributes['Units'].value,
            :value => raw_item.get('ItemAttributes/PackageDimensions/Length')
        }


        #require 'pp'
        #pp raw_item
        #pp item

        item
      end
    end
  end
end
