class PortalsController < ApplicationController
  before_action :set_portal, only: [:show, :edit, :update, :destroy]

  # GET /portals
  # GET /portals.json
  def index
    @portals = Portal.all
  end

  # GET /portals/1
  # GET /portals/1.json
  def show
    @kaminari_histories = History.where_portal(@portal.id,params[:page].to_i)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal
      @portal = Portal.find(params[:id])
    end
end
