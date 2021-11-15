class UsagesController < ApplicationController
  def index
    @usage = Usage.new
    @usages = Usage.all
  end

  def create
    @usage = Usage.new(course_params)
    @usage.save
    @usages = Usage.all
  end

  private
  def course_params
    params.require(:usage).permit(:name)
  end
end
