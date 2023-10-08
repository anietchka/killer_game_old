require 'rails_helper'

RSpec.describe Mission, type: :model do
    let(:user) { create(:user, email: 'johndoe@gmail.com') }
    let(:game) { create(:game, user:) }
    describe '#kill association' do
        let!(:player) { create(:player, game:, user:, player_code: 3456) }
        let!(:mission) { create(:mission) }
        let!(:kill1) { create(:kill, player:, target_code: 123, mission:) }
        let!(:kill2) { create(:kill, player:, target_code: 234, mission:) }
        it "has many kills with dependent destroy" do
          expect(mission.kills.count).to eq(2)
    
          mission.destroy
    
          expect(Kill.find_by(id: kill1.id)).to be_nil
          expect(Kill.find_by(id: kill2.id)).to be_nil
        end
      end
end