class User < ActiveRecord::Base

  validates :name,  presence: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  has_attached_file :avatar, :styles => {small: "150x150>"}, default_url: '01.png'
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } ,
                       :size => {:in => 0..1.megabytes}

end