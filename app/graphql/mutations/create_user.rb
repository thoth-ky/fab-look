module Mutations
  class CreateUser < BaseMutation
    null true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true
    field :token, String, null:true

    def resolve(auth_provider: nil, first_name: nil, last_name: nil)
     user = User.create!(
                  first_name: first_name,
                  last_name: last_name,
                  email: auth_provider[:email],
                  password: auth_provider[:password]
          )
     crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
     token = crypt.encrypt_and_sign("user-id:#{ user.id }")

     context[:token] = token

     {user: user, token: token}

    rescue ActiveRecord::RecordInvalid => e
      error_message = {errors: e.record.errors.full_messages}
      GraphQL::ExecutionError.new( "Error Messages", extensions: error_message)
    end
  end
end