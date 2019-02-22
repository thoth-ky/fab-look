# frozen_string_literal: true

module Types
  class UserProfileType < Types::BaseObject
    include Rails.application.routes.url_helpers
    graphql_name 'UserProfile'

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

    def avatar
      rails_blob_path(object.avatar, only_path: true)
    end

  end
end
