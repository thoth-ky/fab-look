# frozen_string_literal: true

module AuthorizeUserHelper
  def self.check_auth(ctx)
    if ctx[:current_user]
      true
    else
      raise GraphQL::ExecutionError, {errors: ['User not signed in']}.to_json
    end
  end
end
