class TrainServiceStatusController < ApplicationController
  def index
    favorite_trains = FavoriteTrain.all

    train_informations = TrainInformationsCreator.create

    @all_train_informations = []
    @favortite_train_tnformations = []
    train_informations.each do |train_information|
      @all_train_informations.push(train_information)

      favorite_trains.each do |favorite_train|
        if favorite_train == train_information.train
          @favortite_train_tnformations.push(train_information)
          break
        end
      end
    end
  end
end
