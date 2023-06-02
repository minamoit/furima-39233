class PruchaseForm
  include ActiveModel::Model
  attr_accessor :purchase, :address

  def save
    if valid?
      item = Item.find(item_id)
      purchase = item.purchases.build(user_id: user_id)
      if purchase.save
        item.update(stock: item.stock - 1) 
        return true
      else
        return false
      end
    else
      return false
    end
  end