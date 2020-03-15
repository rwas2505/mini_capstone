class Supplier < ApplicationRecord
  # has_many :products
  #above does the same as below but everything has to be done correctly otherwise it breaks. 
  #So:
  # must have table called products
  # must have products table have a column called supplier_id
  # column must have an integer 
  def products
    Product.where(supplier_id: id)
  end

end
