require 'rails_helper'

RSpec.describe ToDo, type: :model do
  
  describe 'overdue?' do
    it 'past due date' do
      todo = ToDo.new(title: 'write blog post', due_date: Date.yesterday)

      expect(todo).to be_overdue
    end

    it 'due today' do
      todo = ToDo.new(title: 'write blog post', due_date: Date.today)

      expect(todo).to_not be_overdue
    end

    it 'future due date' do
      todo = ToDo.new(title: 'write blog post', due_date: Date.tomorrow)

      expect(todo).to_not be_overdue
    end

    it 'blank due date' do
      todo = ToDo.new(title: 'write blog post', due_date: nil)

      expect(todo).to_not be_overdue
    end
  end

end
