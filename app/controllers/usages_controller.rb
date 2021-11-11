class UsagesController < ApplicationController
  def index
    @usages = Usages.all
    @usage = Usage.new
  end

  def create
    @usage = Usage.new(course_params)
    @usage.save
  end

  private
  def course_params
    params.require(:usage).permit(:name)
  end
end
