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
    res
  end

  describe 'create profile mutation' do
    let(:query_string) do
      %|
        mutation {
          createProfile(
            input: {
              profileDetails: {
                fullnames: "#{Faker::Name.name}"
                avatar: "#{Faker::Internet.url}"
              }
            }
          ){
            profile{
              id
              fullnames
              avatar
              user {
                email
              }
            }
          }
        }
      |
    end

    context 'user not signed in' do
      it 'fails to create profile' do
        errors = result['errors']
        expect(errors[0]['message']).to eq('User not signed in')
      end
    end

    context 'user signed in' do
      let(:user) { create(:user) }
      let(:context) { { current_user: user } }
      it 'successfully creates profile once user' do
        profile_data = result['data']['createProfile']['profile']
        expect(profile_data).to include('id', 'fullnames', 'avatar', 'user')
        expect(profile_data['user']['email']).to eq(user.email)
      end
    end
  end
end
