class ShoutsController < ApplicationController
  def create
    @shout = current_user.shouts.new(shout_params)

    if @shout.save
      redirect_to dashboard_path
    else
      flash.alert = "Could not Shout"
      redirect_to dashboard_path
    end
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
