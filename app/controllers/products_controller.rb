class ProductsController < ApplicationController
  before_action :get_params, only: [:show]
  def index
    @products = Product.all
    @client = Client.find(1)
    @baskets = Basket.all
    @total = get_total
  end

  def show
    
  end

  def buy
    client_id, product_id = params[:client_id], params[:product_id] 

    @basket = Basket.new

    @basket.client_id = client_id

    @basket.product_id = product_id

    if @basket.save
      @baskets = Basket.all
      @total = get_total

      @save = true

    else
      @save = false

    end
  end

  private

  def get_total
    Basket.total_tax
  end

  def get_params
    @product = Product.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:client_id, :product_id)
  end
end
