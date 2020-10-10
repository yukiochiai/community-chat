# 浅草情報
![画像名](13781901_1036604386435082_1209282850028030517_n.jpg)

## 概要
浅草観光の情報を記録・共有できるサイトです。

## 本番環境
http://54.150.13.58/

## 制作背景
人力車のお仕事をしていた頃、あまり、情報を仕入れずに観光地に訪れる方が多かったのがありました。実は、浅草は美味しいお食事処や名店、寺社仏閣が数多くあり、訪れ体験することにより、満足のいく観光ができるように制作しました。

## アプリの使い方
・Chromeの最新版を利用してアクセス。
・ゲストログイン、または新規登録していただき、サイト内に入ります。<br>
・新規投稿<br>
　右上の新規投稿ボタンを押下→情報を入力（タイトル、画像、カテゴリー、本文）→投稿するボタン<br>
・情報詳細の閲覧・いいね機能<br>
　ホーム画面では、他ユーザーの投稿を閲覧、いいねを押すことができます。<br>
・検索機能<br>
　投稿が多くなれば、検索で情報をヒットできます。<br>

## 工夫したポイント
浅草観光といってもバラエティーに溢れているため、様々なニーズに応え、タグを取り入れました。また、第一印象で楽しそうや美味しそうというイメージを描かせるために画像をメインに見せ、文章の情報が多くならないよう、シンプルな設計になるよう工夫しました。

## 使用技術(開発環境)
・ Ruby 2.5.1<br>・ Ruby on Rails 5.2.3<br>・ MySQL5.6.47<br>・ HTML<br>・ CSS<br>・ AWS(EC2,RDS,S3)<br>・ Github<br>・ Nginx, Unicorn<br>・Rspec(単体/結合）

## 課題や今後実装したい機能
・　機能数が少なく、簡素的なサイトになっている。<br>
・　訪日観光客も利用できるように、多言語機能を取り入れたい。<br>
・　検索でユーザーの希望にヒットしにくい。<br>
・　検索しやすいように、検索機能に絞り込みの条件を実装したい。<br>
・　Javascriptを使用してUI/UXを整えていきたい。<br>
・　開発をよりスムーズに効率的に進めるために、docker-composeとCircleCIを学び取り入れたい。<br>
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
