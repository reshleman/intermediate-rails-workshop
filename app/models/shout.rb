class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  default_scope { order("created_at DESC") }

  searchable do
    text :content do
      content.index
    end
  end
end
