class City < ApplicationRecord
  belongs_to :advice_materials , optional: true
end
