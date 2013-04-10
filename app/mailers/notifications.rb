class Notifications < ActionMailer::Base

  def purchased_interview(user, interview)
    @user = user
    @interview = interview
    mail :to => user.email, :from => 'flyingfoggy@gmail.com', :subject => "Thanks for your purchase, #{user.name.titleize}"
  end
end