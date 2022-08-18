module ToDosHelper
  def to_do_status(to_do)
    return if to_do.due_date.blank?

    if to_do.due_date.past?
      tag.span 'overdue', class: 'overdue'
    elsif to_do.due_date.today?
      tag.span 'due today', class: 'today'
    else
      tag.span 'due soon', class: 'soon'
    end
  end
end
