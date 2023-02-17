class BuildsController < ApplicationController
  before_action :set_build, only: %i[ show edit update destroy ]

  # GET /builds or /builds.json
  def index
    @builds = Build.all
  end

  # GET /builds/1 or /builds/1.json
  def show
  end

  # POST /builds or /builds.json
  def create
    @build = Build.new(build_params)
    @build.webhook_action_id = params[:webhook_action_id]
    if @build.save
      render :show, status: :created
    else
      render json: @build.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_build
      @build = Build.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def build_params
      params.require(:build).permit(:webhook_action, :webhook_action_id, :build_info)
    end
end
