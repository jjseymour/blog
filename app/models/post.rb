class Post < ApplicationRecord
  belongs_to :user

  def self.get_blog_posts(user)
    tumblr_blog_post_call(user)
  end

  private

  def self.tumblr_blog_post_call(user)
    JSON.parse(RestClient.get("https://api.tumblr.com/v2/blog/#{user}.tumblr.com/posts/text?api_key=ENV['TUMBLR_API_KEY']"))
  end
end
