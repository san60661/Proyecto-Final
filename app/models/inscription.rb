class Inscription < ApplicationRecord
  validates :user_id, uniqueness: true

  belongs_to :auction, autosave: true
  belongs_to :user, autosave: true
end
