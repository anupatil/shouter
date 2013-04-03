class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new #instance variable that says when we create a new user it will be submitted to the user database model
  end

  def create
    @user = User.new (params[:user])
    @user.save!
  end

  def destroy
  end
end
