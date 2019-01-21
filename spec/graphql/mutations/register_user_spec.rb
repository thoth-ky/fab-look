# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FabLookSchema do
  let(:context) { {} }
  let(:variables) { {} }

  let(:result) do
    res = FabLookSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    pp res if res['errors']
    res
  end

  describe 'a specific query' do
    let(:query_string) do
      %|
      mutation {
        registerUser(
          input: {
            userDetails: {
              email: "#{Faker::Internet.email}"
              password: "#{Faker::Internet.password}"
            }
          }
        ){
          user {
            email
             id
          }
        }
      }
      |
    end

    context 'can register new user' do
      it 'registers user successfully' do
        user_data = result['data']['registerUser']['user']
        expect(user_data).to include('email', 'id')
      end
    end
  end
end
