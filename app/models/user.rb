class User
  include Mongoid::Document
  include Mongoid::Paperclip

  has_and_belongs_to_many :courses
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  field :name, type: String
  field :email, type: String
  field :description, type: String
  field :password, type: String
  field :password_confirmation, type: String

  validates_uniqueness_of :name, {case_sensitive: true}
  validates_uniqueness_of :email
  
  #validates_presence_of :slug

  attr_accessor :login
  
  attr_accessible :photo, :login, :name, :email, :password, :password_confirmation, #:slug

  #función epecífica para Mongoid
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      self.any_of({ name:  /^#{Regexp.escape(login)}$/i }, { email:  /^#{Regexp.escape(login)}$/i }).first
    else
      super
    end
  end

  #slug describes the part of a URL that is made up of human-readable keywords
  # def slug
    
  #   name.downcase.gsub(" ", "-")  
  # end

  def to_param
    "profile" #slug
  end

  #To attachment photo
  #view configuration in application.rb and aws.yml
  has_mongoid_attached_file :photo,
    storage: :s3,
    s3_credentials: File.join(Rails.root, 'config', 'aws.yml'),
    path: 'photos/:id_image'

  validates_attachment_content_type :photo, 
                                    content_type: /^image\/(png|jpg|jpeg)/,
                                    message: 'only (png/jpg/jpeg) images'
  
end
