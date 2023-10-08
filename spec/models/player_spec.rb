require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:user) { create(:user, email: 'johndoe@gmail.com') }
  let(:game) { create(:game) }

  describe '#game association' do
    let(:player) { build(:player, game_id:, user:, player_code: 3456) }
    context 'when no game id' do
      let(:game_id) { nil }
      it { expect(player.valid?).to be_falsey }
    end
    context 'when game id is present' do
      let(:game_id) { game.id }
      it { expect(player.valid?).to be_truthy }
    end
  end

  describe '#user association' do
    let(:player) { build(:player, game:, user_id:) }
    context 'when no user id' do
      let(:user_id) { nil }
      it { expect(player.valid?).to be_truthy }
    end
    context 'when user id is present' do
      let(:user_id) { user.id }
      it { expect(player.valid?).to be_truthy }
    end
  end

  describe '#kills association' do
    let!(:player) { create(:player, game:, user:, player_code: 3456) }
    let!(:mission) { create(:mission) }
    let!(:kill1) { create(:kill, player:, target_code: 123, mission:) }
    let!(:kill2) { create(:kill, player:, target_code: 234, mission:) }
    it "has many players with dependent destroy" do
      expect(player.kills.count).to eq(2)

      player.destroy

      expect(Kill.find_by(id: kill1.id)).to be_nil
      expect(Kill.find_by(id: kill2.id)).to be_nil
    end
  end

  describe '#validation' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:status) }
    it { expect(subject).to validate_inclusion_of(:status).in_array(%w[initialized in_game killed]) }
    it { expect(subject).to validate_presence_of(:player_type) }
    it { expect(subject).to validate_inclusion_of(:player_type).in_array(%w[player admin]) }
  end
end
