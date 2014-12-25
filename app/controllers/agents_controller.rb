class AgentsController < ApplicationController
  before_action :set_agent, only: [:show]

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    @kaminari_histories = History.where_agent(@agent.id,params[:page].to_i)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end
end
