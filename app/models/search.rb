class Search
  include ActiveModel::Conversion

  attr_reader :term

  def initialize(options = {})
    @term = options.fetch(:term, "")
  end

  def shouts
    Shout.search { fulltext(term) }.results
  end
end
