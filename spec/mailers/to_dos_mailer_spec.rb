require "rails_helper"

RSpec.describe ToDosMailer, type: :mailer do
  
  describe "daily_reminder" do
    
    context "with 1 to-do with past due date" do
      it "renders the body" do
        ToDo.create(title: 'write blog post', due_date: Date.yesterday)
        
        mail = ToDosMailer.daily_reminder

        expect(mail.body).to include "You have 1 to-do"
      end
    end

    context "without any to-dos" do
      it "renders the body" do
        mail = ToDosMailer.daily_reminder

        expect(mail.body).to include "You have no to-dos"
      end
    end

  end

end
