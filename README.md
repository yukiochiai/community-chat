# 浅草情報
![画像名](13781901_1036604386435082_1209282850028030517_n.jpg)

## 概要
浅草観光の情報を記録・共有できるサイトです。

## 本番環境
http://54.150.13.58/

## 制作背景
人力車のお仕事をしていた頃、あまり、情報を仕入れずに観光地に訪れる方が多かったのがありました。実は、浅草は美味しいお食事処や名店、寺社仏閣が数多くあり、訪れ体験することにより、満足のいく観光ができるように制作しました。

## 工夫したポイント
浅草観光といってもバラエティーに溢れているため、様々なニーズに応え、タグ付け機能を取り入れました。文字の情報量が多いと、ユーザーとして使いにくさがあると思い、画像を大きく見せ、シンプルな設計をなるよう工夫しました。

## 使用技術(開発環境)
・ Ruby 2.5.1<br>・ Ruby on Rails 5.2.3<br>・ MySQL5.6.47<br>・ HTML<br>・ CSS<br>・ AWS(EC2,SSM,S3)<br>・ Github<br>・ Nginx, Unicorn

## 課題や今後実装したい機能

## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|
|resetpassword_sent_at|string|

### Association
- has_many :tweets, dependent: :destroy
- has_many :favorites, dependent: :destroy


## tweetsテーブル

|Column|Type|Option|
|------|----|------|
|title|string|null: false|
|category|string|null: false|
|image|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user
- has_many :favorites, dependent: :destroy
- has_many :comments
- mount_uploader :image, ImageUploader

## favorites テーブル
|Column|Type|Option|
|------|----|------|
|user_id|integer|
|tweet_id|integer|

### Association
- belongs_to :user
- belongs_to :tweet
