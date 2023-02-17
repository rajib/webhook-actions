class WebhookActionsController < ApplicationController
  before_action :set_webhook_action, only: %i[ show edit update destroy ]

  # GET /webhook_actions or /webhook_actions.json
  def index
    @webhook_actions = WebhookAction.all
  end

  # GET /webhook_actions/1 or /webhook_actions/1.json
  def show
  end

  # GET /webhook_actions/new
  def new
    @webhook_action = WebhookAction.new
  end

  # GET /webhook_actions/1/edit
  def edit
  end

  # POST /webhook_actions or /webhook_actions.json
  def create
    @webhook_action = WebhookAction.new(webhook_action_params)

    respond_to do |format|
      if @webhook_action.save
        format.html { redirect_to webhook_action_url(@webhook_action), notice: "Webhook action was successfully created." }
        format.json { render :show, status: :created, location: @webhook_action }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webhook_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webhook_actions/1 or /webhook_actions/1.json
  def update
    respond_to do |format|
      if @webhook_action.update(webhook_action_params)
        format.html { redirect_to webhook_action_url(@webhook_action), notice: "Webhook action was successfully updated." }
        format.json { render :show, status: :ok, location: @webhook_action }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webhook_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webhook_actions/1 or /webhook_actions/1.json
  def destroy
    @webhook_action.destroy

    respond_to do |format|
      format.html { redirect_to webhook_actions_url, notice: "Webhook action was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webhook_action
      @webhook_action = WebhookAction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webhook_action_params
      params.require(:webhook_action).permit(:title, :script_type, :script)
    end
end
