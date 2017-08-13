class TrainServiceStatusController < ApplicationController
  def index
    @all_train_informations = []
    @favortite_train_tnformations = []
    train_informations = TrainInformationsCreator.create
    train_informations.each do |train_information|
      @all_train_informations.push(train_information)
      @favortite_train_tnformations.push(train_information) if train_information.train == '江ノ島電鉄線'
    end
  end
end
