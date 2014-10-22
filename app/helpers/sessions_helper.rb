module SessionsHelper
	def sign_in(user)    # створити юзера (залогінитись на сайт, створити сессію)
		remember_token= User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?    # Перевірити, який запросив,  залогінений,
    !current_user.nil?
    end

	def current_user=(user)  # Провірити поточного юзера
        @current_user = user
    end
    def current_user
    remember_token = User.encrypt(cookies[:remember_token])   # (false - не працює User.encrypt(cookies[:remember_token])) - Запамятати особливий "ключ", підпис  для  юзера на сервері, створити файли куки для клієнта
    @current_user ||= User.find_by(remember_token: remember_token)
    end

    def sign_out    # - Розлогінитись, видалити сесію та ф. куки.
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
