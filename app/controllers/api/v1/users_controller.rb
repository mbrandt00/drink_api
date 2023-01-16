class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by(email: params[:email]) do |user|
      user.first_name = params[:given_name]
      user.last_name = params[:family_name]
    end
    if user
      render json: {user: user, message: 'Logged in Successfully'}, status: :ok
    else
      render :nothing => true, :status => :unprocessable_entity
    end
  end

  def update
    binding.pry
  end

  def destroy
    binding.pry
  end
end
