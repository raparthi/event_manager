class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, through: :event_users, autosave: true

  validate :endtime_cannot_be_lessthan_start_time

  accepts_nested_attributes_for :event_users

  def accepted_count
    event_users.where(status: 'Accepted').count
  end

  def rejected_count
    event_users.where(status: 'Rejected').count
  end

  def endtime_cannot_be_lessthan_start_time
    errors.add(:end, "end time can't be greater than start time") if start > self.end
  end
end
