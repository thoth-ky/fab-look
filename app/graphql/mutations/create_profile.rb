# frozen_string_literal: true

module Mutations
  class CreateProfile < GraphQL::Schema::RelayClassicMutation
    field :profile, Types::UserProfileType, null: true
    
    argument :file, ApolloUploadServer::Upload, required: false
    argument :profileDetails, Types::ProfileInputType, required: true

    def resolve(args)
      if AuthorizeUserHelper.check_auth(context)
        begin
          input = args[:profile_details].to_h
          input[:user] = context[:current_user]
          @profile = UserProfile.create!(input)
          { profile: @profile }
        rescue ActiveRecord::RecordInvalid => invalid
          GraphQL::ExecutionError.new(
            "Invalid Attributes for #{invalid.record.class.name}:
            #{invalid.record.errors.full_messages.join(', ')}"
          )
        end
      end
    end
  end
end
