# Asakusa_info
![画像名](13781901_1036604386435082_1209282850028030517_n.jpg)

浅草の観光情報を共有できるサイト

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
