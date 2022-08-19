class ToDosMailer < ApplicationMailer

  def daily_reminder(to_dos)
    @to_dos = to_dos
    
    mail to: 'user_email@somedomain.com',
         subject: 'To-dos daily reminder'
  end

end
