class AdminsController < ApplicationController

  def index
    @admins = Admin.all
    render json: @admins
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    admin_user = User.find_by(email:"#{@admin.email}")
    @admin.user_id = admin_user.id
    @admin.save
    redirect_to admin_path(@admin)
  end
end

private

def admin_params
  params.require(:admin).permit(:name, :email)
end
