require "digest/md5"

module ShoutsHelper
  def gravatar(user, size = 48)
    digest = Digest::MD5.hexdigest(user.email)
    image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}")
  end

  def shouterize(text)
    link_hashtags(strip_tags(text)).html_safe
  end

  private

  def link_hashtags(text)
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end
end
