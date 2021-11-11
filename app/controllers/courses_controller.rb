class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
      # if @course.save
      #     logger.debug @course.errors.inspect
      #   render json: {message: 'success'}, status:created
      # else
      #   error_messages = course.errors.key.map {|key| [key, course.errors.full_messages_for(key)]}.to_h
      #   render json: {message: error_messages}, status: :unprocessable_entity
      # end
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
end
