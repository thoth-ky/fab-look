# frozen_string_literal: true

module Types
  class AuthType < Types::BaseObject
    field :authentication_token, String, null: true
  end
end
