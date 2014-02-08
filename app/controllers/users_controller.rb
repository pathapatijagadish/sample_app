class UsersController < ApplicationController
  def index
  	@users=User.find(:all)
    respond_to do |format|
      format.html# { @users }
      format.json { render :json => @users }
      format.xml { render :xml => @users.to_xml }
      #format.all { render :text => "only HTML, XML, and JSON format are supported at the moment." }
    end
  end
  def new
  	@user=User.new
  end
  def create
  	@user=User.new(params[:user])
  	if @user.save
  		flash[:notice]="Record successfully created"
  		redirect_to users_url
  	else
  		# render :text => @user.errors.inspect and return false
  		flash[:error]="Record not created"
  		render "new"
  	end
  end
  def edit
  	@user=User.find(params[:id])
  end
  def update
  	@user=User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:notice]="Record successfully updated"
  		redirect_to users_url
  	else
  		flash[:error]="Record not updated"
  		render 'edit'
  	end
  end
  def show
  	@user=User.find(params[:id])
  end
  def destroy
  	# render :text => params and return false
  	@user=User.find(params[:id])
  	if @user.destroy
  		flash[:notice]="Record successfully deleted"
  	else
  		flash[:error]="Record not deleted"
	end
  	redirect_to users_url
  end

end
