class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
