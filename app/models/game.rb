class Game < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy
  INITIALIZED = "initialized"
  STARTED = "started"
  FINISH = "finish"
  AUTO = "auto"
  MANUAL = "manual"
  STATUS = [INITIALIZED, STARTED, FINISH]
  GAME_TYPE = [AUTO, MANUAL]
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :game_type, presence: true, inclusion: { in: GAME_TYPE }

end
