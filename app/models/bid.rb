class Bid < ApplicationRecord
  belongs_to :user, autosave: true
  belongs_to :auction, autosave: true
end
