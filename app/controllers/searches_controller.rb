class SearchesController < ApplicationController
  def show
    @search = Search.new(params[:search])
  end
end
