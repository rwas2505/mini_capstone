class Product < ApplicationRecord
  validates :name, length: { maximum: 40} 
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}

  def supplier
    Supplier.find_by(id: supplier_id)
  end
  #belongs_to :supplier does same as above, but 

  def is_discounted?
    price < 10
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
