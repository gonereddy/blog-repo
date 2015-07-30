class UsersController < ApplicationController
	def index
        @users = User.all
    end
 

 	def new
 		@user = User.new
 	end

 	def create
 		@user = User.new(user_params)
 		if @user.save
 			redirect_to user_path(@user.id)
 		else
 			render :action => "new"
 		end
 	end

 	def edit
    	@user = User.find(params[:id])
      @users = User.all
   	end

  	 def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to user_path(@user.id)
        else
      render :action => "edit"
      end
  end

  	def show
      if current_user.super_admin
        @users = User.all
      else
        flash[:notice] = "You dont have permission to Access this page"
        redirect_to blogs_path
      end
    end
	
	def destroy
    	@user = User.find(params[:id])
    	if @user.delete
    		redirect_to users_path
    	end
  	end

  def permissions
    if current_user.super_admin
  	params[:status].each do |id|
  		@user = User.find(id)
  	 @user.update_attributes(:status => true, :admin => true, :guest => false)
  	end
  	redirect_to users_path
    else
        flash[:notice] = "You dont have permission to Access this page"
        redirect_to blogs_path
    end
  end


    private
     
     # Never trust parameters from the scary internet, only allow the white list through.
     def user_params
       params.require(:user).permit(:super_admin, :admin, :status, :guest)
     end
	
end
