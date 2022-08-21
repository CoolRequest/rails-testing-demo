class ExportToDoJob < ApplicationJob
  queue_as :default

  def perform(to_do)
    logger.info "Exporting to-do ##{to_do.id} to external system..."
  end
end
