class AddUserToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_profiles, :user, foreign_key: true
  end
end
