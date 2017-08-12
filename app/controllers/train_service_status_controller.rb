class TrainServiceStatusController < ApplicationController
  def index
    @allTrainInformations = []
    @favortiteTrainInformations = []
    trainInformations = TrainInformationsCreator.create
    trainInformations.each do |trainInformation|
      @allTrainInformations.push(trainInformation) if trainInformation.train
      @favortiteTrainInformations.push(trainInformation) if trainInformation.train && trainInformation.train.content == '江ノ島電鉄線'
    end

    render 'index'
  end
end
