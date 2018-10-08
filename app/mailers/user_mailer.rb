class UserMailer < ApplicationMailer
  def accept_mail(obj)
    @user = obj.user
    @id = obj.id
    mail(to: @emails, subject: 'You have been invited to the event')
  end
end
