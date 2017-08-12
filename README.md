# README

## odds and ends
### functions
- Notify train informations (in Kanoto, Japan with the Yahoo路線情報/運行情報 関東 (https://transit.yahoo.co.jp/traininfo/area/4/)) to your any Slack channnel.
- Show (real time??) train informations on your browser.


## Ruby version
2.4.1p111

## Rails version
5.1.3

## System dependencies
- Ubuntu16.04
- MySql5.7

## Configuration
- Create .env with next codes
```
SLACK_WEBHOOK_URL = "your slack webhook url"
SLACK_TRAIN_NOTIFICATION_CHANNEL = "like channel"
SLACK_TRAIN_NOTIFICATION_USER = "train infomation"
```

- Create database.yml adjusted your environment

## Database creation
```
rails db:create
```

## Database initialization
```
rails db:migrate:reset
```

## Services (job queues, cache servers, search engines, etc.)
- crontab (with whenever gem)
To be notified, run next command that update your crontab.
```
bundle exec whenever --update-crontab
```