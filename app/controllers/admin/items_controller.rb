class Admin::ItemsController < ApplicationController

def index
  @items = Item.all
end

def new
end

def create
  @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
end

def show
  @item = Item.find(params[:id])
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
