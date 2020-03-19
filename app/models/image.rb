class Image < ApplicationRecord
  #below line does same thing as product method
  belongs_to :product

  # def product
  #   #product_id means this image.product_id
  #   Product.find(product_id)
  # end
end
