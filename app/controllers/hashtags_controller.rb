class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @shouts = Shout.search("##{@hashtag}")
  end
end
