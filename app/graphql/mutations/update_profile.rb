module Mutations
  class UpdateProfile < GraphQL::Schema::RelayClassicMutation
    field :profile, Types::UserProfileType, null: false

    argument :profileDetails, Types::ProfileInputType, required: true
    argument :id, ID, required: true

    def resolve(args)
      if AuthorizeUserHelper.check_auth(context)
        begin
          input = args[:profile_details].to_h
          @profile = UserProfile.find_by_id(args[:id])
          @profile.update_attributes(input)
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
