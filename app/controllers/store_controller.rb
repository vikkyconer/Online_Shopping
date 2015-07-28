class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    @cart = current_cart
  	if session[:counter].nil?
  		puts "first time"
  		session[:counter] = 1 
  	else
  		puts "not first time"
  		session[:counter] += 1
  	end
  end
end
