class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:show, :submit, :cancel, :close, :delete, :edit]
  before_action :set_open_purchase, only: [:add_to_cart]

  def add_to_cart
  	if (@order = @purchase.orders.where(item_id: order_params[:item_id]).any?)
		  redirect_to action: "edit", id: @purchase.id
    else
      @purchase.orders.create(item_id: order_params[:item_id], quantity: order_params[:quantity], purchase_id: @purchase.id,
      totalPrice: (order_params[:quantity].to_i * (Item.find(order_params[:item_id]).price.to_f)))
    end
    #redirect_to action: "edit", id: @purchase.id
  end

  def update
    @purchase = Purchase.find(params[:id])
    i=0    
    @purchase.orders.each do |order|
      order.update(quantity: purchase_params[:quantity][i],
        totalPrice: purchase_params[:quantity][i].to_i *
        Item.find(order.item_id).price.to_f)
      i =+ 1
    end
    @purchase.update(:orders => @purchase.orders)
    redirect_back(fallback_location: purchases_index_path)
  end

  def edit

  end

  def index
    @purchases = current_user.purchases
    if current_user.role? :admin
      @purchases = index_all
    end
  end

  def index_own
    @purchases = Purchase.where(user: current_user)
  end

  def index_all
    @purchases = Purchase.all
  end   

  def show
    
  end

  def delete
    Purchase.find(@purchase.id).delete
    redirect_to action: "index"
  end

  def submit
    @purchase.status = 'pending'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  def cancel
    @purchase.status = 'cancelled'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  def close
    @purchase.status = 'completed'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  private

    def set_open_purchase
     	@purchase = Purchase.where(user_id: current_user.id, status: 'open')[0]
      if(@purchase==nil)
        @purchase = Purchase.create(user_id: current_user.id, status: 'open')
      end
    end

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:quantity => [])
    end

    def order_params
      params.require(:order).permit(:item_id,:quantity)
    end

end