class CaptureHistoriesController < ApplicationController
  before_action :set_capture_history, only: [:show, :edit, :update, :destroy]

  # GET /capture_histories
  # GET /capture_histories.json
  def index
    @capture_histories = CaptureHistory.all
  end

  # GET /capture_histories/1
  # GET /capture_histories/1.json
  def show
  end

  # GET /capture_histories/new
  def new
    @capture_history = CaptureHistory.new
  end

  # GET /capture_histories/1/edit
  def edit
  end

  # POST /capture_histories
  # POST /capture_histories.json
  def create
    @capture_history = CaptureHistory.new(capture_history_params)

    respond_to do |format|
      if @capture_history.save
        format.html { redirect_to @capture_history, notice: 'Capture history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @capture_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @capture_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capture_histories/1
  # PATCH/PUT /capture_histories/1.json
  def update
    respond_to do |format|
      if @capture_history.update(capture_history_params)
        format.html { redirect_to @capture_history, notice: 'Capture history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @capture_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capture_histories/1
  # DELETE /capture_histories/1.json
  def destroy
    @capture_history.destroy
    respond_to do |format|
      format.html { redirect_to capture_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture_history
      @capture_history = CaptureHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capture_history_params
      params.require(:capture_history).permit(:ident_code, :action_time, :agent_id, :portal_id)
    end
end
