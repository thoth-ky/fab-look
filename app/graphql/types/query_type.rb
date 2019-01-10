# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    graphql_name 'Query'

    field :user_profile, UserProfileType, null: true do
      description 'Return a profile'
      argument :id, ID, required: true
    end

    def user_profile(id:)
      UserProfile.find_by(id: id)
    end
  end
end
