class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :advice_material, dependent: :destroy
  has_many :weather_forecasts
  has_one :hairs_feature, dependent: :destroy
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  def full_register
    advice_material.present? && hairs_feature.present?
  end
  def no_hairs_feature
    advice_material.present? && !hairs_feature.present?
  end
  def no_advice_material
    !advice_material.present? && hairs_feature.present?
  end
  def no_register
    !advice_material.present? && !hairs_feature.present?
  end
end
