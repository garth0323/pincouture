class UserMailer < ActionMailer::Base
  default from: "contact@pincouture.com"

  def signup_confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Welcome to Pincouture"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
