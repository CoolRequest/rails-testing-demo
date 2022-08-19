class DailyReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @to_dos = ToDo.where('due_date <= ?', Date.today)
    ToDosMailer.daily_reminder(@to_dos).deliver_now if @to_dos.any?
  end
end
