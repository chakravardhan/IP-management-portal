class UsersController < ApplicationController

 
  def index
  	if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @ownership = @user.ownerships
    @users=User.all
  end
 
  def index1
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @ownership = @user.ownerships
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def index2
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @ownership = @user.ownerships
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def index3
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @ownership = @user.ownerships
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end



  def new

  end


end
