class Tweet < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :image, :category, :content, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments
  mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Tweet.where('content LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
