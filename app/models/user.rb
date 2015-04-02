class User < ActiveRecord::Base
  enum role: [:user, :manager, :admin]
  enum category: [:student, :staff, :club]
  after_initialize :set_default_role, :if => :new_record?

  has_and_belongs_to_many :projects
  has_many :projects
  has_many :events
  has_many :news

  def set_default_role
  	if User.count == 0
	    self.role = :admin
  	else
  		self.role = :user
  	end
  end

  def to_label
    self.name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
