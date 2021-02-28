class HomesController < ApplicationController
  before_action :authenticate_customer!
  def top
    @items = Item.last(4)
  end

  def about
  end

end
