class TablenumbersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tablenumbers = Tablenumber.all
    @tablenumber = Tablenumber.new
  end

  def create
    @tablenumber = Tablenumber.new(tablenumber_params)
    @tablenumber.save
    @tablenumbers = Tablenumber.all
  end

  private
  def tablenumber_params
    params.require(:tablenumber).permit(:name)
  end
end
