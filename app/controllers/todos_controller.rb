class TodosController < ApplicationController
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

end
