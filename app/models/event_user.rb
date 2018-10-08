class EventUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  after_create :send_mail

  private

  def send_mail
    UserMailer.accept_mail(self).deliver_now
  end

  def check_user_availabitity; end
end
