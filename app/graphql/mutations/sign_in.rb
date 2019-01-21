# frozen_string_literal: true

module Mutations
  class SignIn < GraphQL::Schema::RelayClassicMutation
    field :auth, Types::AuthType, null: true

    argument :userDetails, Types::UserInputType, required: true

    # TODO: define resolve method
    def resolve(args)
      input = args[:user_details].to_h
      email = input[:email]
      password = input[:password]
      @user = User.find_for_database_authentication(email: email)

      if @user&.valid_password?(password)
        auth_token = @user.authentication_token
        {
          auth: {
            authentication_token: auth_token
          }
        }
      else
        GraphQL::ExecutionError.new('Incorrect Email/Password')
      end
    end
  end
end
