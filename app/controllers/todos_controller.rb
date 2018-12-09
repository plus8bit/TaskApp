class TodosController < ApplicationController

  before_action :authenticate_user!
  before_action :user_params

  def index
    @user = User.find(params[:user_id])
    @todos = @user.todos
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])    
  end


  private

  def user_params
    if current_user != User.find(params[:user_id])
    redirect_to root_path
    end
  end


end
