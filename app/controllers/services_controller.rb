class ServicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]

  def index
    @services = current_user.services.all
  end

  def create
    omniauth = request.env['omniauth.auth']
    if omniauth && params[:service]
      service_route = params[:service]
      @service = service_route
        if service_route == 'facebook'
          omniauth['extra']['raw_info']['email'] ? @email =  omniauth['extra']['raw_info']['email'] : @email = ''
          omniauth['extra']['raw_info']['name'] ? @name =  omniauth['extra']['raw_info']['name'] : @name = ''
          omniauth['extra']['raw_info']['id'] ?  @uid =  omniauth['extra']['raw_info']['id'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route == 'twitter'
          @email = ''
          omniauth['info']['nickname'] ? @name =  omniauth['info']['nickname'] : @name = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route = 'google'
          omniauth['info']['name'] ? @name =  omniauth['info']['name'] : @name = ''
          omniauth['info']['email'] ?  @email =  omniauth['info']['email'] : @email = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route = 'github'
          omniauth['info']['email'] ? @email =  omniauth['info']['email'] : @email = ''
          omniauth['info']['nickname'] ? @name =  omniauth['info']['nickname'] : @name = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route = 'vkontakte'
          omniauth['info']['name'] ? @name =  omniauth['info']['name'] : @name = ''
          omniauth['info']['email'] ?  @email =  omniauth['info']['email'] : @email = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        end
    #else render :text => omniauth.to_yaml
    end

    if @uid != '' and @provider != ''
      auth = Service.find_by_provider_and_uid(@provider, @uid)
        if !auth
          @email = "example@gmail.com" if @email.blank?
          @user = User.create(name: @name, email: @email, password: "foobar", password_confirmation: "foobar")
          @user.services << Service.create(:provider => @provider, :uid => @uid, :uname => @name, :uemail => @email)
          flash[:notice] = 'Sign in via ' + @provider.capitalize + ' has been added to your account.'
          @user.save
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