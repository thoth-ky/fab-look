# frozen_string_literal: true

module AuthorizeUserHelper
  def self.check_auth(ctx)
    if ctx[:current_user]
      true
    else
      raise GraphQL::ExecutionError, 'User not signed in'
    end
  end
end
