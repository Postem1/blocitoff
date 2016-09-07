class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)

    redirect_to current_user if @item.save
  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy # rubocop:disable Style/GuardClause
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
