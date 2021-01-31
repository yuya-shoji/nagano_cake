class Admin::ItemsController < ApplicationController

def index
end

def new
  @items = Item.new
end

def create
  @item = Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
end

def show
end

def edit
end

def update
end

private
  def item_params
    params.permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end
end
