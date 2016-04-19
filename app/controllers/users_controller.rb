class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) #Finds the user with a given id
  end

  def new
  	@user = User.new
  end
end
