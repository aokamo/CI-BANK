class TablenumbersController < ApplicationController
  def index
    @tablernumbers = Tablenumber.all
    @tablenumber = Tablenumber.new
  end

  def create
    @tablenumber = Tablenumber.new(tablenumber_params)
    @tablenumber.save
  end

  private
  def course_params
    params.require(:tablenumber).permit(:name)
  end
end
