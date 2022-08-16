class ToDo < ApplicationRecord
  validates :title, presence: true

  def overdue?
    due_date.present? && due_date < Date.today
  end
end
