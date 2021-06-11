require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do 
    subject { described_class.new(user, record) }

    let(:record) { create(:user) }

    context 'when logged in as admin user' do 
        let(:user) { create(:admin) }

        it { is_expected.to permit_actions(%i[create show update destroy]) }
    end

    context 'when logged in as the user' do 
        let(:user) { record }

        it { is_expected.to permit_actions(%i[show update destroy]) }
        it { is_expected.to forbid_action(:create)}
    end

    context 'when logged in as non-admin user' do 
        let(:user) { create(:user) }

        it { is_expected.to forbid_actions(%i[create show update destroy]) }    
    end

    context 'when not logged in' do
        let(:user) { nil }
    
        it { is_expected.to permit_action(:create) }
        it { is_expected.to forbid_actions(%i[show update destroy]) }
      end    
end