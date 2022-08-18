require 'rails_helper'

RSpec.describe ToDosHelper, type: :helper do
  context "blank due date" do
    it "returns nothing" do
      to_do = ToDo.new(due_date: nil)

      expect(helper.to_do_status(to_do)).to be_blank
    end
  end

  context "past due date" do
    it "returns 'overdue' label" do
      to_do = ToDo.new(due_date: Date.yesterday)

      expect(helper.to_do_status(to_do)).to include 'overdue'
    end
  end

  context "due today" do
    it "returns 'due today' label" do
      to_do = ToDo.new(due_date: Date.today)

      expect(helper.to_do_status(to_do)).to include 'due today'
    end
  end

  context "future due date" do
    it "returns 'due soon' label" do
      to_do = ToDo.new(due_date: Date.tomorrow)

      expect(helper.to_do_status(to_do)).to include 'due soon'
    end
  end
end
