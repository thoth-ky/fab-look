# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :signIn, mutation: Mutations::SignIn
    field :createProfile, mutation: Mutations::CreateProfile
    field :registerUser, mutation: Mutations::RegisterUser
  end
end
