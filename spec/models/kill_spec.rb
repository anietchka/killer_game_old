require 'rails_helper'

RSpec.describe Kill, type: :model do
  let!(:user) { create(:user) }
  let!(:game) { create(:game, user:) }
  let!(:player) { create(:player, game:) }
  let!(:mission) { create(:mission) }

  describe '#player association' do
    let(:kill) { build(:kill, player_id:, mission:) }
    context 'when no player id' do
      let(:player_id) { nil }
      it { expect(kill.valid?).to be_falsey }
    end
    context 'when player id is present' do
      let(:player_id) { player.id }
      it { expect(kill.valid?).to be_truthy }
    end
  end

  describe '#mission association' do
    let(:kill) { build(:kill, mission_id:, player:) }
    context 'when no mission id' do
      let(:mission_id) { nil }
      it { expect(kill.valid?).to be_falsey }
    end
    context 'when mission id is present' do
      let(:mission_id) { mission.id }
      it { expect(kill.valid?).to be_truthy }
    end
  end

  describe '#validation' do
    it { expect(subject).to validate_presence_of(:target_code) }
  end
end