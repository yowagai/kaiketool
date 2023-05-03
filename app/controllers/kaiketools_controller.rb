class KaiketoolsController < ApplicationController
  def index
    if user_signed_in?
      @search_history_user = SearchHistory.find_by(user_id: current_user.id)
    else
      @search_history_user = nil
    end
  end
end
