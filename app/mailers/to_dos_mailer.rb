class ToDosMailer < ApplicationMailer

  def daily_reminder
    @to_dos = ToDo.where('due_date <= ?', Date.today)
        
    mail to: 'user_email@somedomain.com',
         subject: 'To-dos daily reminder'
  end

end
