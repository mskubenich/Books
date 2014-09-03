class UsersController < ApplicationController
  
  load_and_authorize_resource except: [:new, :create, :confirm]
  before_action :signed_in_user, except: [:new, :create, :confirm]
  def show
    @user = current_user
  end	

  def new
  	@user = User.new
  end
   
  def create
    @user = User.new( user_params )
    respond_to do |format|
      if @user.save
       
        # Сказать UserMailer отослать приветственное письмо после сохранения
        UserMailer.welcome_email(@user, confirm_users_url(sign_in_token: @user.sign_in_token) ).deliver
        
        format.html { redirect_to(root_path, notice: 'You have successfully registered. We send you an activation email! Please check your email and click the link to activate the report. ') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @user = current_user
  end 

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end 

  def confirm
    @user = User.find_by_sign_in_token(params[:sign_in_token])
    unless @user
     redirect_to(root_path, notice: 'Invalid confirmation token')
      
    else 
      @user.update_attribute(:sign_in_token , nil)
      sign_in @user
      redirect_to @user, :notice => "Email has been verified."
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
    end

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end
