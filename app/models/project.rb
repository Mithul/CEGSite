class Project < ActiveRecord::Base
  	enum status: [:completed, :pending, :in_progress]

	acts_as_taggable
	# Proffessor
	belongs_to :mentor, class_name: 'User'
	# Student Teams
	has_and_belongs_to_many :members, class_name: 'User'
	accepts_nested_attributes_for :members, :reject_if => :check_member, :allow_destroy => true

	protected

    def check_member(member_attr)
    	puts member_attr.to_s + '*'*100
	    if _member = User.find(member_attr['name'])
	    	self.members << _member
	    	return true
	   	end
	    return false
    end

end
