class TrainInformationNotification
  def self.notify
    favorite_trains = FavoriteTrain.all

    text = "*電車遅延・運転見合わせ情報*\n"
    train_informations = TrainInformationsCreator.create
    train_informations.each do |train_information|
      favorite_trains.each do |favorite_train|
        if favorite_train == train_information.train
          text.concat("*・#{train_information.train}*\n　#{train_information.status}\n　#{train_information.detail}\n\n")
          break
        end
      end
    end
    text.concat('詳細情報(情報元)：https://transit.yahoo.co.jp/traininfo/area/4/')

    Notification.notify(ENV['SLACK_TRAIN_NOTIFICATION_CHANNEL'], ENV['SLACK_TRAIN_NOTIFICATION_USER'], text) if text.count("\n") > 1
  end
end
