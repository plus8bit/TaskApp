class TodosController < ApplicationController

  before_action :authenticate_user!
  before_action :check_params

  def index
    @user = User.find(params[:user_id])
    @todos = @user.todos
  end

  def new
    @user = User.find(params[:user_id])
    @todo = @user.todos.new
  end

  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.create(params.require(:todo).permit(:title, :description))

    if @todo.save
      redirect_to action:'index'
    else
      render :new
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])    
  end


  private

  def check_params
    if current_user != User.find(params[:user_id])
    redirect_to root_path
    end
  end


end
