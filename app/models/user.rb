class User < ActiveRecord::Base
  enum role: [:student, :staff, :club, :admin]
  after_initialize :set_default_role, :if => :new_record?

  belongs_to :project

  def set_default_role
  	if User.count == 0
	    self.role = :admin
	else
		self.role = :student
	end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
