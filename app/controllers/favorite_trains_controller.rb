class FavoriteTrainsController < ApplicationController
  def index
    @favorite_trains = FavoriteTrain.all
  end

  def create
    FavoriteTrain.create(favorite_train_params)
    redirect_to favorite_trains_path
  end
  
  def new
    @favorite_train = FavoriteTrain.new
  end

  def destroy
    favorite_train = FavoriteTrain.find(params[:id])
    favorite_train.destroy

    redirect_to favorite_trains_path
  end

  private
    def favorite_train_params
      params.require(:favorite_train).permit(:name)
    end
end