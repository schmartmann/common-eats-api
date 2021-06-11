# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  admin           :boolean          default(FALSE), not null
#  customer        :boolean          default(FALSE), not null
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string
#  phone           :string           not null
#  restauranteur   :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'model validations' do 

        describe 'email' do
            subject { build(:user, email: nil)}
            it { is_expected.to be_invalid }
        end

        describe 'first_name' do 
            subject { build(:user, first_name: nil )}
            it { is_expected.to be_invalid }
        end

        describe 'last_name' do 
            subject { build(:user, last_name: nil )}
            it { is_expected.to be_invalid }
        end

        describe 'phone' do 
            subject { build(:user, phone: nil )}
            it { is_expected.to be_invalid }
        end
    end
end
