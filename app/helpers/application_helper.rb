module ApplicationHelper

   def admin(user)
        link_to 'Create category', new_category_path, class: 'nav-link font-weight-bold' if !user.nil? && user.admin
    end

end
