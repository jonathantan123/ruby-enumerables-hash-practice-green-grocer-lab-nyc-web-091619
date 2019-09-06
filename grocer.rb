def consolidate_cart(cart)
 consolidated_cart = {} 
  cart.each do |item_hash|
item_hash.each do |item_name, attributes|
  consolidated_cart[item_name] = attributes
  if consolidated_cart[item_name][:count]
    consolidated_cart[item_name][:count] += 1
  else 
  consolidated_cart[item_name][:count] = 1 
end 
end 
end 
consolidated_cart
end 



def apply_coupons(cart, coupons)
  coupons.each do |coupon| 
  item_name = coupon[:item]
  coupon_item = "#{item_name} W/COUPON"
  
  if cart[item_name]
    if cart[item_name][:count] >= coupon[:num]
    
    if cart[coupon_item]
      cart[coupon_item][:count] += coupon[:num]
      cart[item_name][:count] -= coupon[:num] 
      
      else
        cart[coupon_item]= {:price => coupon[:cost]/coupon[:num], :clearance => cart[item_name][:clearance], :count => coupon[:num] }
      cart[item_name][:count] -= coupon[:num] 
      end
    end
   end 
 end
 cart 
 end 
    

def apply_clearance(cart)
  cart.each do |item, attributes|
    if attributes[:clearance] == true 
      attributes[:price] = (attributes[:price]* 0.8).round(2)
    end
  end 
  cart 
end 

def checkout(items, coupons)
  cart1 = consolidate_cart(items)
  cart2 = apply_coupons(cart1, coupons)
  cart3 = apply_clearance(cart2)
  
  total = 0
  
  cart3.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end
  total > 100 ? total * 0.9.round(2) : total.round(2)
  
end
  
    

