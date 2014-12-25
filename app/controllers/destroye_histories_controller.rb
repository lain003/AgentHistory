class DestroyeHistoriesController < ApplicationController
  before_action :set_destroye_history, only: [:show, :edit, :update, :destroy]

  # GET /destroye_histories
  # GET /destroye_histories.json
  def index
    @destroye_histories = DestroyeHistory.all
  end

  # GET /destroye_histories/1
  # GET /destroye_histories/1.json
  def show
  end

  # GET /destroye_histories/new
  def new
    @destroye_history = DestroyeHistory.new
  end

  # GET /destroye_histories/1/edit
  def edit
  end

  # POST /destroye_histories
  # POST /destroye_histories.json
  def create
    @destroye_history = DestroyeHistory.new(destroye_history_params)

    respond_to do |format|
      if @destroye_history.save
        format.html { redirect_to @destroye_history, notice: 'Destroye history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @destroye_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @destroye_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destroye_histories/1
  # PATCH/PUT /destroye_histories/1.json
  def update
    respond_to do |format|
      if @destroye_history.update(destroye_history_params)
        format.html { redirect_to @destroye_history, notice: 'Destroye history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @destroye_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destroye_histories/1
  # DELETE /destroye_histories/1.json
  def destroy
    @destroye_history.destroy
    respond_to do |format|
      format.html { redirect_to destroye_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destroye_history
      @destroye_history = DestroyeHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destroye_history_params
      params.require(:destroye_history).permit(:ident_code, :action_time, :agent_id, :portal_id, :resonator_level)
    end
end
