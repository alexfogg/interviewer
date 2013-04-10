module ApplicationHelper
  def login_helper
    nav=""
    if @auth.present?
      nav += "<li>#{link_to('All Interviews', interviews_path)}</li>"
      nav += "<li>#{link_to('Profile', user_path(@auth), :class => 'button tiny success')}</li>"
      nav += "<li>#{link_to(@auth.email, login_path, :method => :delete, :remote => true, :class => 'button tiny alert')}</li>"

    else

      nav += "<li>#{link_to("Login", login_path, :remote => true, :class => 'button tiny alert login', :id => 'login')}</li>"
      nav += "<li>#{link_to("Register", new_user_path, :remote => true, :class => 'button tiny alert')}</li>"
    end
  end
end
