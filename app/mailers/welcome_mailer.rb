class WelcomeMailer < ActionMailer::Base
  default from: "welcome@opentable.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Open Table')
  end
end
