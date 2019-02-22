# frozen_string_literal: true

module Mutations
  class CreateProfile < GraphQL::Schema::RelayClassicMutation
    field :profile, Types::UserProfileType, null: true
    
    argument :profileDetails, Types::ProfileInputType, required: true

    def resolve(args)
      if AuthorizeUserHelper.check_auth(context)
        begin
          input = args[:profile_details].to_h
    
          user = User.first # context[:current_user]
          
          @profile = UserProfile.find_or_create_by(user_id: user.id)
          @profile.update_attributes(input.reject{ |_, v| v.blank? })

          { profile: @profile }
        rescue ActiveRecord::RecordInvalid => invalid
          GraphQL::ExecutionError.new(
            {
              errors: invalid.record.errors.full_messages
            }.to_json
          )
        end
      end
    end
  end
end
