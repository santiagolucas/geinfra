module ApplicationHelper
  
  CONTROL = [
    ["Usuário", "Usuário"],
    ["Mac", "Mac"]
    ]
  
  
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
  end
  
  def options_for_control(selected)
    options_for_select(CONTROL, selected)
  end
end
