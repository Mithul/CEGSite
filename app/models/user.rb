class User < ActiveRecord::Base
  enum role: [:student, :staff, :club, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_and_belongs_to_many :projects
  has_many :projects

  def set_default_role
  	if User.count == 0
	    self.role = :admin
	else
		self.role = :student
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
