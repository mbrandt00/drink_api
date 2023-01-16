class Api::V1::UsersController < ApplicationController
  before_action :find_user, except: %i[create logout]
  def create
    user = User.find_or_create_by(email: params[:email]) do |user|
      user.first_name = params[:given_name]
      user.last_name = params[:family_name]
    end
    if user
      session[:user_id] = user.id
      render json: { user: user, logged_in: true, status: :created }
    else
      render json: { status: 401 }
    end
  end

  def update
    # todo
  end

  def logout
    session[:user_id] = nil
    render json: {
      logged_in: false
    }
  end

  def destroy
    # logout
    return unless @user.delete

    render json: { message: 'User deleted' }, status: :no_content
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
