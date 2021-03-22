module ApplicationHelper
    def hidden_header_footer
    params[:controller] == ("devise/sessions") or ("devise/registrations" and params[:action] == "new")
    end
end
