module CurrentUserConcern
  extend ActiveSupport::Concern
    #overriding devise's current_user method
    #allowing for guest users to visit the site
    def current_user
      super || guest_user
    end

    def guest_user
      OpenStruct.new(
        name: "Guest User", 
        first_name: "Guest", 
        last_name: "User", 
        email: "guest@example.com"
      )
    end
end