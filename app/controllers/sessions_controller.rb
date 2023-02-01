class SessionsController < ApplicationController

  def create
    user = User.find_by("username=?", params[:username])
    session[:user_id]||= ""
    if user
      session[:user_id] = user.id
      render json: {id: user.id, username: user.username}, status: :ok
    else
      render json: {error: "Unauthorized"}, status: :unauthorized
    end
  end

  def destroy
    
    session.delete :user_id
    head :no_content


  end
end
