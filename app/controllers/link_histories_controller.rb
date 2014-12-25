class LinkHistoriesController < ApplicationController
  before_action :set_link_history, only: [:show, :edit, :update, :destroy]

  # GET /link_histories
  # GET /link_histories.json
  def index
    @link_histories = LinkHistory.all
  end

  # GET /link_histories/1
  # GET /link_histories/1.json
  def show
  end

  # GET /link_histories/new
  def new
    @link_history = LinkHistory.new
  end

  # GET /link_histories/1/edit
  def edit
  end

  # POST /link_histories
  # POST /link_histories.json
  def create
    @link_history = LinkHistory.new(link_history_params)

    respond_to do |format|
      if @link_history.save
        format.html { redirect_to @link_history, notice: 'Link history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @link_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_histories/1
  # PATCH/PUT /link_histories/1.json
  def update
    respond_to do |format|
      if @link_history.update(link_history_params)
        format.html { redirect_to @link_history, notice: 'Link history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_histories/1
  # DELETE /link_histories/1.json
  def destroy
    @link_history.destroy
    respond_to do |format|
      format.html { redirect_to link_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_history
      @link_history = LinkHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_history_params
      params.require(:link_history).permit(:ident_code, :action_time, :agent_id, :to_portal_id, :from_portal_id)
    end
end
