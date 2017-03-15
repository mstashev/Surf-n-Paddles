class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'mstashev@gmail.com', subject: "Welcome to Chirpy!")
  end

end
