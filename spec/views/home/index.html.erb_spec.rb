require 'rails_helper'

RSpec.describe "home/index", type: :view do
  context 'with overdue tasks' do
    it 'shows welcome message with warning' do
      assign(:overdue_to_dos_count, 3)

      render

      expect(rendered).to include 'Get to work!'
    end
  end

  context 'without overdue tasks' do
    it 'shows welcome message with congrats' do
      assign(:overdue_to_dos_count, 0)

      render

      expect(rendered).to include 'Congratulations'
    end
  end
end
