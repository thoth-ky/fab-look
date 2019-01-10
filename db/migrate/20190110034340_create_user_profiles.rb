# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :fullnames
      t.string :bio
      t.string :avatar
      t.string :phonenumber
      t.string :location
      t.string :occupation
      t.string :website

      t.timestamps
    end
  end
end
