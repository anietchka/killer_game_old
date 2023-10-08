class Kill < ApplicationRecord
  belongs_to :player
  belongs_to :mission
  validates :target_code, presence: true
end
