class CommentsController < ApplicationController

	before_filter :authenticate_user!, only: :create

	def create
		
		@course = Course.find(params[:course_id])
		@comment = @course.comments.create!(params[:comment])

		redirect_to @course, notice: "Comment was successfully created."
	end

end