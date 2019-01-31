module Mutations
  class CreateUser < BaseMutation

    class AuthProviderSignUpData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: false
    end

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, AuthProviderSignUpData, required: false

    type Types::UserType

    def resolve(auth_provider: nil, first_name: nil, last_name: nil)
      User.create!(
              first_name: first_name,
              last_name: last_name,
              email: auth_provider&.[](:email)&.[](:email),
              password: auth_provider&.[](:email)&.[](:password)
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end