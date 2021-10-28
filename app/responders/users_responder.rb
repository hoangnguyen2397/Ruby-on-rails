class UsersResponder < ApplicationResponder
    topic :users

    def respond(user)
      respond_to :users, user
    end
end