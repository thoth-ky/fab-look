# frozen_string_literal: true

module Mutations
  class RegisterUser < GraphQL::Schema::RelayClassicMutation
    field :user, Types::UserType, null: false

    argument :userDetails, Types::UserInputType, required: true

    def resolve(args)
      input = args[:user_details].to_h
      begin
        @user = User.create!(input)
        { user: @user }
      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new(
          "Invalid Attributes for #{invalid.record.class.name}:
          #{invalid.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end
end
