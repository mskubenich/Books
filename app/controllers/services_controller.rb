class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create]

  def index
    @services = current_user.services.all
  end

  def create
    omniauth = request.env['omniauth.auth']
    #render :text => omniauth.to_yaml and return
    if omniauth && params[:service]
      service_route = params[:service]
      @service = service_route
        if service_route == 'facebook'
          omniauth['extra']['raw_info']['email'] ? @email =  omniauth['extra']['raw_info']['email'] : @email = ''
          omniauth['extra']['raw_info']['name'] ? @name =  omniauth['extra']['raw_info']['name'] : @name = ''
          omniauth['extra']['raw_info']['id'] ?  @uid =  omniauth['extra']['raw_info']['id'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route == 'twitter'
          @email = 'example@twitter.com'
          omniauth['info']['nickname'] ? @name =  omniauth['info']['nickname'] : @name = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route == 'google_oauth2'
          omniauth['info']['name'] ? @name =  omniauth['info']['name'] : @name = ''
          omniauth['info']['email'] ?  @email =  omniauth['info']['email'] : @email = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          @provider = 'google'
        elsif service_route == 'github'
          @email = "example@github.com" if @email.blank?
          omniauth['info']['nickname'] ? @name =  omniauth['info']['nickname'] : @name = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        elsif service_route == 'vkontakte'
          @email = "example@vk.com" if @email.blank?
          omniauth['info']['name'] ? @name =  omniauth['info']['name'] : @name = ''
          omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
          omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''
        end
    else render :text => omniauth.to_yaml
    end
    
    if  @email != ''
        existinguser = User.find_by_email(@email) || current_user
        if existinguser
          sign_in existinguser unless current_user
          current_user.services.create(:provider => @provider, :uid => @uid, :uname => @name, :uemail => @email)
          flash[:notice] = 'Sign in via ' + @provider.capitalize + ' has been added to your account ' + existinguser.email + '. Signed in successfully!'
          sign_in existinguser
          redirect_to existinguser
        else
          params[:name] = params[:name][0, 39] if params[:name].to_s.length > 39
          user = User.new(:email => @email,
                          :password => SecureRandom.hex(10),
                          :name => @name,
                          :facebook => params[:facebook_link],
                          :twitter => params[:twitter_link],
                          :google => params[:google_link],
                          :github => params[:github_link],
                          :vkontakte => params[:vkontakte_link]
          )
          user.services.build(:provider => @provider, :uid => @uid, :uname => @name, :uemail => @email)
          user.save!

          flash[:notice] = 'Your account on CommunityGuides has been created via ' + params[:provider].capitalize + '. In your profile you can change your personal information and add a local password.'
          sign_in user
          redirect_to user
        end
      else
        flash[:error] =  @provider.to_s.capitalize + ' can not be used to sign-up on CommunityGuides as no valid email address and zip code has been provided. Please use another authentication provider or use local sign-up. If you already have an account, please sign-in and add ' + @provider.to_s + ' from your profile.'
        redirect_to current_user
      end
  end

  def destroy
    @service = current_user.services.find(params[:id])
    if current_user.services.length > 1
      @service.destroy
    else
      flash[:error] = 'Can\'t destroy last service.'
    end
    redirect_to services_path
  end
end
