require 'rails_helper'
RSpec.describe Tweet, type: :model do
  describe '#create' do 
    # context 'tweetを保存できる場合' do
    #   it "titleとcategoryとimageとcontentがあれば保存できること" do
    #     tweet = build(:tweet, title: "aaaaaaa", category: "bbbbbb", image:"test_image.jpg", content: "cccccc")
    #     expect(build(:tweet)).to be_valid
    #   end
    # end

    context 'tweetを保存できない場合' do
      it 'titleがない場合は保存できない' do
        tweet = build(:tweet, title: nil, category: "bbbbbb", image:"test_image.jpg", content: "cccccc")
        tweet.valid?
        expect(tweet.errors[:title]).to include("を入力してください")
      end 

      it 'categoryがない場合は保存できない' do
        tweet = build(:tweet, category: nil)
        tweet.valid?
        expect(tweet.errors[:category]).to include("を入力してください")
      end

      it 'imageがない場合は保存できない' do
        tweet = build(:tweet, image: nil)
        tweet.valid?
        expect(tweet.errors[:image]).to include("を入力してください")
      end

      it 'contentがない場合は保存できない' do
        tweet = build(:tweet, content: nil)
        tweet.valid?
        expect(tweet.errors[:content]).to include("を入力してください")
      end
    end
  end
end