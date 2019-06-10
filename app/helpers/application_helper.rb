module ApplicationHelper
  
  def request_count
    current_user.received_requests.count
  end
end
