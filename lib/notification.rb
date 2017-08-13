class Notification
  def self.notify(channel, username, text)
    slack = Slack::Incoming::Webhooks.new(ENV['SLACK_WEBHOOK_URL'], channel: channel, username: username)
    slack.post text

    slack2 = Slack::Incoming::Webhooks.new(ENV['SLACK_WEBHOOK_URL2'], channel: "#train_information", username: username)
    slack2.post text

  end
end
