# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :profile, UserProfileType, null: true

    def profile
      UserProfile.find_by(user_id: object.id)
    end
  end
end
