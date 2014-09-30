class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  default_scope { order("created_at DESC") }

  def self.search(term)
    text_shouts = TextShout.where("body LIKE ?", "%#{term}%")
    where(content_type: "TextShout", content_id: text_shouts)
  end
end
