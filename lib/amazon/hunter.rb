require 'amazon/hunter/version'
require 'amazon/item'
require 'amazon/ecs'

module Amazon
  class Hunter
    class << self
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

        item.height = dimension('Height', raw_item)
        item.weight = dimension('Weight', raw_item)
        item.width = dimension('Width', raw_item)
        item.length = dimension('Length', raw_item)

        item
      end

      def config=(config)
        Amazon::Ecs.options = config
      end

      private

      def dimension(dimension, item)
        element = item.get_element("ItemAttributes/PackageDimensions/#{dimension}")
        if element
          {
            units: element.attributes['Units'].value,
            value: item.get("ItemAttributes/PackageDimensions/#{dimension}")
          }
        else
          nil
        end
      end
    end
  end
end
