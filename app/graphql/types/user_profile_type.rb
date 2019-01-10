module Types
  class UserProfileType < Types::BaseObject
    graphql_name 'UserProfile'
    # description "Fetches a User profile"

    field :id, ID, null: false
    field :fullnames, String, null: true
    field :bio, String, null: true
    field :avatar, String, null: true
    field :phonenumber, String, null: true
    field :location, String, null: true
    field :occupation, String, null: true
    field :website, String, null: true

    field :user, Types::UserType, null: false

    def user
      object.user
    end
  end
end
