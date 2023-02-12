class AdviceMaterial < ApplicationRecord
  belongs_to :user 
  has_one :city
  validates :user_id, uniqueness: true
end
