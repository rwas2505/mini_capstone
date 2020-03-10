class Product < ApplicationRecord
  def is_discounted?
    if price < 10
      "True"
    else
      "False"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
