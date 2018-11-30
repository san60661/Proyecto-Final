class Inscription < ApplicationRecord
  belongs_to :auction, autosave: true
  belongs_to :user, autosave: true
end
