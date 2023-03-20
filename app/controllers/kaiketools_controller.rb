class KaiketoolsController < ApplicationController
  def index
  end

  def new
    @kaiketool = Kaiketool.new
  end

  def create
    @kaiketool = Kaiketool.new(kaiketool_params)
    if @kaiketool.save
      redirect_to kaiketool_path
    else
      render "google_custom_search/index"
    end
  end

  def show

  end

  private

  def kaiketool_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
