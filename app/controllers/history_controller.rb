class HistoryController < ApplicationController
  def index
    @kaminari_histories = History.select(params[:page].to_i);
  end
end
