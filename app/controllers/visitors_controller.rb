class VisitorsController < ApplicationController
	def index
		@about = Static.find_by_name('about')
		@events = Static.find_by_name('events')
	end
end
