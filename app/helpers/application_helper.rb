module ApplicationHelper
  def login_helper
    nav=""
    if @auth.present?
      nav+= "<li>#{link_to(@auth.email, login_path, :method => :delete, :remote => true, :class => 'button tiny alert')}</li>"
      nav += "<li>#{link_to('Profile', '#', :class => 'button tiny success')}</li>"
    else

      nav += "<li>#{link_to("Login", login_path, :remote => true, :class => 'button tiny alert')}</li>"
      nav += "<li>#{link_to("Register", '/new', :remote => true, :class => 'button tiny alert')}</li>"
    end
  end
end
