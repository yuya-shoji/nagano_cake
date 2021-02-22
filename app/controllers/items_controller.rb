class ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
    @count = Item.all.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
  end

end
