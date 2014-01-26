module Amazon
  class Item
    attr_accessor :asin, :title, :product_group, :sales_rank,
                  :small_image, :medium_image, :large_image,
                  :brand, :sku, :mpn, :upc, :upc_list, :part_number,
                  :height, :weight, :length, :width
  end

  def dimensions
    [@width, @height, @length, @weight]
  end
end
