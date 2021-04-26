module ApplicationHelper
  def button_text
    if controller.action_name == "new"
       return "Add My Shop"
    elsif controller.action_name == "edit"
       return "Edit Shop"
    else
       return "Submit"
    end
  end
end
