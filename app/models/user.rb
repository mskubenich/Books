class User < ActiveRecord::Base
  belongs_to :role

  has_many :friendships
  has_many :friends,
           :through => :friendships,
           :conditions => "status = 'accepted'",
           :order => :name
  has_many :requested_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'requested'",
           :order => :created_at
  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'pending'",
           :order => :created_at

  has_many :services, :dependent => :destroy

  validates :name,  presence: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :generate_sign_in_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :update, :unless => lambda{ |user| user.password.blank? }

  has_attached_file :avatar, :styles => {:small => "150x150>", :thumb => "100x100>"}, :default_url => 'default_avatar.png'
  validates_attachment :avatar,
                       :content_type => { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } ,
                       :size => {:in => 0..1.megabytes}

  before_create { generate_token(:auth_token) }

  def admin?
    self.role.present? && self.role.name == 'admin'
  end

  def user?
    self.role.present? && self.role.name == 'user'
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end                  

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def generate_sign_in_token
    self.sign_in_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  private

    def create_remember_token
    	self.remember_token = User.encrypt(User.new_remember_token)
    end
end

