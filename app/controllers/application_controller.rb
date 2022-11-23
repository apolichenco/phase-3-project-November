class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/categories' do
    categories = Category.all
    categories.to_json(include: { products: {include: :prices } } )
  end

  # get '/categories/:id' do
  #   category = Category.find(params[:id])
  #   category.to_json
  # end

  # get '/products' do
  #   products = Product.all
  #   products.to_json(methods: [:sell_for_value])
  # end

  patch '/products/:id' do
    # product = Product.find(params[:id])
    # product.to_json
  end

  post '/prices' do
    # prices = Price.all
    # prices.to_json
  end

  delete '/prices/:id' do
    # price = Price.find(params[:id])
    # price.to_json
  end

end
