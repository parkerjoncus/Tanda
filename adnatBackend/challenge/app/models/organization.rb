class Organization < ApplicationRecord
  belongs_to :user, optional: true
end
