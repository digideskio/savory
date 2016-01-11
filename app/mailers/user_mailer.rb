class UserMailer < ApplicationMailer
  default :from => "Savory <savoryrails@gmail.com>"

  def password_reset(user)
    @user = user
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>",
         :subject => "Savory Password Reset")
  end
end
