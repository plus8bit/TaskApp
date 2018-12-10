class TodosController < ApplicationController

  before_action :authenticate_user!
  before_action :check_params

  def index
    @todos = user_params.todos
  end

  def new
    @todo = user_params.todos.new
  end

  def create
    @todo = user_params.todos.create(params.require(:todo).permit(:title, :description))

    if @todo.save
      redirect_to action:'index'
    else
      render :new
    end
  end

  def destroy
    @todo = user_params.todos.find(params[:id])

    @todo.destroy
    redirect_to action: 'index'
  end

  def edit
  end

  def show
    @todo = user_params.todos.find(params[:id])    
  end


  private

  def check_params
    if current_user != User.find(params[:user_id])
    redirect_to root_path
    end
  end

  def user_params
    @user = User.find(params[:user_id])
  end


end
