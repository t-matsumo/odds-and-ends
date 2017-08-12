class Notification
  def self.notify(channel, username, text)
    slack = Slack::Incoming::Webhooks.new(ENV['SLACK_WEBHOOK_URL'], channel: channel, username: username)
    slack.post text
  end
end