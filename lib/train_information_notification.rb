class TrainInformationNotification
  def self.notify
    text = "電車遅延・運転見合わせ情報\n路線     状況     詳細    \n"
    trainInformations = TrainInformationsCreator.create
    trainInformations.each do |trainInformation|
      text.concat("#{trainInformation.train} #{trainInformation.status} #{trainInformation.detail}\n") if trainInformation.train
    end

    Notification.notify(ENV['SLACK_TRAIN_NOTIFICATION_CHANNEL'], ENV['SLACK_TRAIN_NOTIFICATION_USER'], text) if text.count('\n') > 2
  end
end