class BuildsController < ApplicationController
  before_action :set_build, only: %i[ show edit update destroy ]

  # GET /builds or /builds.json
  def index
    @webhook_action = WebhookAction.find(params[:webhook_action_id])
    @builds = @webhook_action.builds
  end

  # GET /builds/1 or /builds/1.json
  def show
  end

  # POST /builds or /builds.json
  def create
    @build = Build.new(build_params)
    @build.webhook_action_id = @webhook_action.id
    if @build.save
      @@webhook_action.script.split("\r\n").each do |cmd|
        Rails.logger.info "Exc: #{cmd}"
        system(cmd)
      end
      
      render :show, status: :created
    else
      render json: @build.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @webhook_action = WebhookAction.find(params[:webhook_action_id])
      @build = Build.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def build_params
      params.require(:build).permit(:webhook_action, :webhook_action_id, :build_info)
    end
end
