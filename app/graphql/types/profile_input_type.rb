# frozen_string_literal: true

module Types
  class ProfileInputType < Types::BaseInputObject
    argument :fullnames, String, required: false
    argument :bio, String, required: false
    argument :avatar, Types::FileType, required: false
    argument :phonenumber, String, required: false
    argument :location, String, required: false
    argument :occupation, String, required: false
    argument :website, String, required: false
  end
end
