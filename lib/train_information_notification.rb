class TrainInformationNotification
  def self.notify
    text = "*電車遅延・運転見合わせ情報*\n"
    train_informations = TrainInformationsCreator.create
    train_informations.each do |train_information|
      text.concat("*・#{train_information.train}*\n　#{train_information.status}\n　#{train_information.detail}\n\n")
    end
    text.concat('詳細情報：https://transit.yahoo.co.jp/traininfo/area/4/')
    Notification.notify(ENV['SLACK_TRAIN_NOTIFICATION_CHANNEL'], ENV['SLACK_TRAIN_NOTIFICATION_USER'], text) if text.count("\n") > 1
  end
end
