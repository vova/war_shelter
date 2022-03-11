class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: 'Account successfully updated!'
    else
      render :edit # notice: 'Something went wrong...'
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation, :status_id,
    :coordinator_id, :from, :destination, :adults, :kids, :kids_comment,
    :pets, :phone, :phone2, :geo, :accommodation_pref, :transport_id,
    :date_arrival, :request_id, :vaccination, :comment)
  end
end
