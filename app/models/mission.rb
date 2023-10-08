class Mission < ApplicationRecord
    has_many :kills, dependent: :destroy
end
