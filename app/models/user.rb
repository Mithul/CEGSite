class User < ActiveRecord::Base
  enum role: [:user, :manager, :admin]
  enum category: [:student, :staff, :club, :unassigned]
  enum designation: [:HOD, :professor, :associate_proffessor, :assistant_proffessor]
  after_initialize :set_default_role, :if => :new_record?

  before_save :ensure_authentication_token
 
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
 
  has_and_belongs_to_many :projects
  has_many :projects
  has_many :events
  has_many :news
  belongs_to :department

  def set_default_role
  	if User.count == 0
	    self.role = :admin
  	else
  		self.role = :user
  	end
    self.category = :unassigned
  end

  def to_label
    self.name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
