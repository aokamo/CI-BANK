class TablenumbersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tablenumbers = Tablenumber.all
    @tablenumber = Tablenumber.new
    if params[:tablenumber_id].present?
      tablenumber = tablenumber.find(params[:id])
      @tablenumber.name = tablenumber.name
    end
  end

  def create
    @tablenumber = Tablenumber.new(tablenumber_params)
    @tablenumber.save
    @tablenumbers = Tablenumber.all
  end

    def destroy
    @tablenumber = Tablenumber.find(params[:id])
    @tablenumber.destroy
    redirect_to tablenumbers_path
  end

  private
  def tablenumber_params
    params.require(:tablenumber).permit(:name)
  end
end
