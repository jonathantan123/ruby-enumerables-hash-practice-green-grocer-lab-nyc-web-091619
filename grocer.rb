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
  if cart[item_name]
  if cart[item_name] && cart[item_name][:count] >= coupon[:num] && cart["#{item_name} W/COUPON"]
    cart["#{item_name} W/COUPON"][:count] += coupon[:num]
     cart[item_name][:count] -= coupon[:num] 
  else
   cart["#{item_name} W/COUPON"]= {:price => coupon[:cost]/coupon[:num], :clearance => cart[item_name][:clearance], :count => coupon[:num] }
      cart[item_name][:count] -= coupon[:num] 
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

def checkout(cart, coupons)
  first_cart = consolidate_cart(cart)
  second_cart = apply_coupons(first_cart, coupons)
  third_cart = apply_clearance(second_cart)
  
  total = 0 
 end 
 
 if total > 100 
    total = (total * 0.8).round(2)
end 

  
    
  
  
end
