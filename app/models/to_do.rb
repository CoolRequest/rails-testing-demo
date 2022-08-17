class ToDo < ApplicationRecord
  validates :title, presence: true

  scope :overdue, -> { where('due_date < ?', Date.today) }

  def overdue?
    due_date.present? && due_date < Date.today
  end
end
