module ApplicationHelper
  
  def request_count
    current_user.received_requests.count
  end

  def glyph(icon_name_postfix, hash={})
    content_tag :span, nil, hash.merge(class: "glyphicon glyphicon-#{icon_name_postfix.to_s.gsub('_','-')}")
  end
end
