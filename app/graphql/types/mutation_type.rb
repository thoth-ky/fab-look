# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :updateProfile, mutation: Mutations::UpdateProfile
    field :createProfile, mutation: Mutations::CreateProfile
  end
end
