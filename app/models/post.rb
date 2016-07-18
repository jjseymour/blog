class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates_uniqueness_of :title
  validates_presence_of :title, :content

  def self.get_blog_posts(user)
    tumblr_blog_post_call
    @client.posts("#{user}.tumblr.com")["posts"].each do |post|
      Post.create(title: post["title"], content: post["body"], date: post["date"])
    end
  end

  private

  def self.tumblr_blog_post_call
    @client = Tumblr::Client.new({
      :consumer_key => ENV['TUMBLR_API_KEY'],
      :consumer_secret => ENV['TUMBLR_API_SECRET'],
      :oauth_token => ENV['OAUTH_TOKEN'],
      :oauth_token_secret => ENV['OAUTH_SECRET']
    })
  end
end
