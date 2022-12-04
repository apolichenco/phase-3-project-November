class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  get '/categories' do
    categories = Category.all
    categories.to_json(:include => {
      :products => {
        :methods => [:sell_for_value, :last_priced]
        }} )
  end

  get '/products/:id/prices' do
    product = Product.find(params[:id])
    product.prices.to_json()
  end

  patch '/products/:id' do
    product = Product.find(params[:id])
    product.update(
      name: params[:name]
    )
    product.to_json
  end

  delete '/products/:id' do
    product = Product.find(params[:id])
    product.destroy
    product.to_json
  end

  post '/products' do
    product = Product.create(
      name: params[:name],
      category_id: params[:category_id]
    )
    new_product_id = product.id
    Price.create(
      price: 0,
      product_id: new_product_id
      )
    product.to_json(include: :prices)
  end

  post '/prices' do
    price = Price.create(
      price: params[:price],
      product_id: params[:product_id]
    )
    price.delete_zero(params[:product_id])
    price.to_json
  end

end