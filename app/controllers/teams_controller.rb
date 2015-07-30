class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
     if current_user.admin or current_user.super_admin
    @teams = Team.all
    respond_with(@teams)
    else
    flash[:notice] = "You dont have permission to Access this page"
    redirect_to blogs_path
  end
  end

  def show
    if current_user.admin or current_user.super_admin
    respond_with(@team)
    else
    flash[:notice] = "You dont have permission to Access this page"
    redirect_to blogs_path
  end
  end

  def new
    if current_user.admin or current_user.super_admin
    @team = Team.new
    respond_with(@team)
    else
    flash[:notice] = "You dont have permission to Access this page"
    redirect_to blogs_path
  end
  end

  def edit
    if current_user.admin or current_user.super_admin
    else
    flash[:notice] = "You dont have permission to Access this page"
    redirect_to blogs_path
  end
  end

  def create
    @team = Team.new(team_params)
    @team.save
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description, :photo, :facebook_link, :twitter_link, :googleplus_link, :linkedin_link, :email)
    end
end
