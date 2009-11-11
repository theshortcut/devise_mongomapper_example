class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = @user.respond_to?(:confirm!) ? 
                         t('devise.confirmations.send_instructions') :
                         flash[:success] = 'User was successfully created.'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = 'Updated successfully'
      redirect_to root_path
    else
      render :edit
    end
  end
end
