class DeployHistoriesController < ApplicationController
  before_action :set_deploy_history, only: [:show, :edit, :update, :destroy]

  # GET /deploy_histories
  # GET /deploy_histories.json
  def index
    @deploy_histories = DeployHistory.all
  end

  # GET /deploy_histories/1
  # GET /deploy_histories/1.json
  def show
  end

  # GET /deploy_histories/new
  def new
    @deploy_history = DeployHistory.new
  end

  # GET /deploy_histories/1/edit
  def edit
  end

  # POST /deploy_histories
  # POST /deploy_histories.json
  def create
    @deploy_history = DeployHistory.new(deploy_history_params)

    respond_to do |format|
      if @deploy_history.save
        format.html { redirect_to @deploy_history, notice: 'Deploy history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @deploy_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @deploy_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deploy_histories/1
  # PATCH/PUT /deploy_histories/1.json
  def update
    respond_to do |format|
      if @deploy_history.update(deploy_history_params)
        format.html { redirect_to @deploy_history, notice: 'Deploy history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deploy_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deploy_histories/1
  # DELETE /deploy_histories/1.json
  def destroy
    @deploy_history.destroy
    respond_to do |format|
      format.html { redirect_to deploy_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deploy_history
      @deploy_history = DeployHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deploy_history_params
      params.require(:deploy_history).permit(:ident_code, :action_time, :agent_id, :portal_id, :resonator_level)
    end
end
