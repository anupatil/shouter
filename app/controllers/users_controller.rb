class UsersController < ApplicationController
  def index
    #@users = User.all
    @users = User.order(:username).all
  end

  def show
    begin
      @user = User.find params[:id]

    rescue
      redirect_to users_path, :alert => "No user by that ID."
    end
  end

  def edit
    begin
      @user = User.find params[:id]
      rescue
        redirect_to users_path :alert => "No user by that ID."
      end
  end

  def update
    begin
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
    redirect_to @user, notice: "User was saved successfully"
    else 
      render :edit
    end

  rescue
    render :edit
  end
end

  def new
    @user = User.new #instance variable that says when we create a new user it will be submitted to the user database model
  end

  def create
    @user = User.new (params[:user])
    if @user.valid? then
      if @user.save!
        redirect_to @user, notice: "User was saved successfully"
      else 
        render :new
      end
    else 
      render :new
    end
  end

  def destroy
  end
end
