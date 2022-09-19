module ApplicationHelper
  def active_class(status)
    status ? 'text-success' : 'text-danger'
  end
end
