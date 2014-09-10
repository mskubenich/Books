class User < ActiveRecord::Base

  has_many :services, :dependent => :destroy

  validates :name,  presence: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :update, :unless => lambda{ |user| user.password.blank? }

  has_attached_file :avatar, :styles => {small: "150x150>"}, default_url: '01.png'
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } ,
                       :size => {:in => 0..1.megabytes}


  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end                  

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
    	self.remember_token = User.encrypt(User.new_remember_token)
    end
end

