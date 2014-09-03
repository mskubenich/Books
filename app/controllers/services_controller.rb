class ServicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]

  def index
    @services = current_user.services.all
  end

  def create
    omniauth = request.env['omniauth.auth']
    if omniauth
      omniauth['extra']['raw_info']['email'] ? @email =  omniauth['extra']['raw_info']['email'] : @email = ''
      omniauth['extra']['raw_info']['name'] ? @name =  omniauth['extra']['raw_info']['name'] : @name = ''
      omniauth['extra']['raw_info']['id'] ?  @uid =  omniauth['extra']['raw_info']['id'] : @uid = ''
      omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
      @first_name = omniauth['extra']['raw_info']['first_name'] || ''
      @last_name = omniauth['extra']['raw_info']['last_name'] || ''
      @facebook_link = omniauth['extra']['raw_info']['link'] || ''

      # render :text => @uid.to_s + " - " + @name + " - " + @email + " - " + @provider
    end


    if @uid != '' and @provider != ''
      auth = Service.find_by_provider_and_uid(@provider, @uid)
      if !auth
        @user = User.create(name: @name, email: @email, password: "foobar", password_confirmation: "foobar")
        @user.reload.services.create(:provider => @provider, :uid => @uid, :uname => @name, :uemail => @email)
        flash[:notice] = 'Sign in via ' + @provider.capitalize + ' has been added to your account.'
      else
        @user = auth.user
        flash[:notice] = 'Successful login with' + @provider
      end
      sign_in @user
      redirect_to profile_path
    end
  end

  def destroy
    @service = current_user.services.find(params[:id])
    @service.destroy

    redirect_to services_path
  end
end