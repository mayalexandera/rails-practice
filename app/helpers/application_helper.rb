module ApplicationHelper
  def boobs
     if current_user.is_a?(User) 
       link_to "Logout", destroy_user_session_path, method: :delete 
     else
       (link_to "Register", new_user_registration_path) +
       "<br>".html_safe +
       (link_to "Login", new_user_session_path )
     end 
  end

  def sample_helper
    content_tag(:h1, "I'm #sample_helper in application_helper.rb", class: "my-class")
  end

  def source_helper(layout_name)
    if session[:source] 
      greeting = "I'm #source_helper in the application_helper.rb Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class:"source-greeting")
   end 
  end

  def copyright_generator
    MayalexanderaViewTool::Renderer.copyright "Maya Alexandera", "All rights reserved"
  end
end
