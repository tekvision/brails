module ApplicationHelper

  def show_flash_messages(options = {})
    ret = []
    flash.each do |key, value|
      ret << content_tag( :div, {class: "flash alert alert-#{key} global", id: "flash-#{key}"}) do
        content = haml_tag "a.close", "data-dismiss" => "alert" 
        haml_concat value
      end
    end
    return_string = ret.join("\n")
    return return_string.respond_to?(:html_safe) ? return_string.html_safe : return_string
  end
end
