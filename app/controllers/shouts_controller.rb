class ShoutsController < ApplicationController
  def create
    current_user.shouts.create(shout_params)
    redirect_to dashboard_path
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
