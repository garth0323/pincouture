class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail(
      :subject => 'hello',
      :to      =>  @user.email,
      :from    => 'info@pincouture.com',
      :tag     => 'signup'
    )
  end
end
