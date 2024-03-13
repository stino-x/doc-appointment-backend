class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Your code for handling show action goes here
  end
end
