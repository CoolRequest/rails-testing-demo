class HomeController < ApplicationController
  
  def index
    @overdue_to_dos_count = ToDo.overdue.count
  end

end
