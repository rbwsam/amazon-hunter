module Amazon
  class Item
    attr_accessor :asin, :title, :product_group, :sales_rank,
                  :small_image, :medium_image, :large_image,
                  :brand, :sku, :mpn, :upc, :upc_list, :part_number,
                  :height, :weight, :length, :width

    def dimensions
      unless @width.nil? || @height.nil? || @lenght.nil? || @eight.nil?
        [@width, @height, @length, @weight]
      end
    end
  end
end
