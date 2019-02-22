# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
  has_one_attached :avatar
end
