class User < ActiveRecord::Base

  has_many :users_roles
  has_many :roles, :through => :users_roles

  validates :name,  presence: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password 
  validates :password, length: { minimum: 6 }

  has_attached_file :avatar, :styles => {small: "150x150>"}, default_url: '01.png'
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } ,
                       :size => {:in => 0..1.megabytes} 


  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end                  

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def role?(role)
    !!self.roles.find_by_name(role.to_s.camelize)
  end

  def admin?
    self.role? :admin
  end

  def self.user?(user)
    user.role? :user    
  end

  private

    def create_remember_token
    	self.remember_token = User.encrypt(User.new_remember_token)
    end
end

