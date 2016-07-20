class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved successfully"
      redirect_to current_user
    else
      flash.now[:alert] = "There was an error saving the item."
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
