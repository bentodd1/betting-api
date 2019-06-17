class SessionsController < ApplicationController
  def new
  end

  def create
    puts "password is"
    puts params[:password]
    user = User.find_by(email: params[:email].downcase)
    puts user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      puts "Loggin in"
      log_in user

      user.generate_authentication_token!
      puts "password before save"
      puts user.password
      user.save!
      puts user.auth_token
      render json: user, status: 200
    else
      puts "Failed"
      # flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
