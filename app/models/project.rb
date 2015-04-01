class Project < ActiveRecord::Base
	acts_as_taggable
	has_one :user, as: :mentor
	has_many :users, as: :team
end
