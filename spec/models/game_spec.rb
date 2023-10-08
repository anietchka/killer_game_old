require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validation' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:status) }
    it { expect(subject).to validate_inclusion_of(:status).in_array(%w[initialized started finish]) }
    it { expect(subject).to validate_presence_of(:game_type) }
    it { expect(subject).to validate_inclusion_of(:game_type).in_array(%w[auto manual]) }
  end

  describe '#user association' do
    let(:game) { build(:game, user_id: nil) }
    it { expect(game.valid?).to be_falsey }
  end

  describe '#player association' do
    let!(:user) { create(:user) }
    let!(:game) { create(:game, user:) }
    let!(:player1) { create(:player, game:) }
    let!(:player2) { create(:player, game:, name: "Emeric", player_code: 678) }
    it "has many players with dependent destroy" do
      expect(game.players.count).to eq(2)

      game.destroy

      expect(Player.find_by(id: player1.id)).to be_nil
      expect(Player.find_by(id: player2.id)).to be_nil
    end
  end
end
