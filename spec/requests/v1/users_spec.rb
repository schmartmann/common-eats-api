require 'rails_helper'

RSpec.describe 'Users (v1)', type: :request do
    let(:user) { create(:admin) }
    let(:headers) { { Authorization: token_auth(user) } }

    describe 'GET /v1/users' do 
        context 'as an admin' do 
            let!(:users) { create_list(:user, 3) }

            before { get(v1_users_path, headers: headers) }
            
            it { expect(response).to have_http_status(:ok) }

            it 'contains a list of all users' do
              expect(json).to include(*users.append(user).map do |user|
                include(id: user.id)
              end)
            end      
        end

        context 'as a non-admin' do
            let(:user) { create(:user, admin: false) }
      
            before { get(v1_users_path, headers: headers) }
      
            it { expect(response).to have_http_status(:forbidden) }
        end

        context 'as an anonymous user' do
            before { get(v1_users_path) }
      
            it { expect(response).to have_http_status(:unauthorized) }
        end      
    end

    describe 'POST /v1/users' do 
        context 'as an admin' do
            let(:user) { create(:admin) }
            let(:params) do
              {
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::String.random(length: 12),
                phone: Faker::PhoneNumber.phone_number,
                roles: %i[admin restauranteur customer]
              }
            end
      
            before { post(v1_users_path, params: params, headers: headers) }
      
            it { expect(response).to have_http_status(:created) }
      
            it('allows me to create admin users') { expect(User.find(json[:id])).to be_admin }
            it('allows me to create restauranteurs') { expect(User.find(json[:id])).to be_restauranteur }
            it('allows me to create customers') { expect(User.find(json[:id])).to be_customer }      
        end

        context 'as an anonymous user' do
            let(:anonymous_user) { create(:user) }
            let(:params) do
              {
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::String.random(length: 12),
                phone: Faker::PhoneNumber.phone_number,
                roles: %i[admin restauranteur customer]
              }
            end
      
            before { post(v1_users_path, params: params) }
      
            it { expect(response).to have_http_status(:created) }
      
            it('does not allow me to create admin users') { expect(User.find(json[:id])).not_to be_admin }
        end
    end

    describe 'GET /v1/users/:id' do
        let(:other_user) { create(:user) }
  
        context 'as an admin' do
            let(:user) { create(:admin) }

            before { get(v1_user_path(other_user), headers: headers) }

            it { expect(response).to have_http_status(:ok) }
            it { expect(json).to conform_to_json_schema('v1/user') }
            it { expect(json[:id]).to eq(other_user.id) }
        end
  
        context 'as a non-admin' do
            let(:user) { create(:user, admin: false) }
      
            before { get(v1_user_path(other_user), headers: headers) }
      
            it { expect(response).to have_http_status(:forbidden) }
        end
  
        context 'as an anonymous user' do
            before { get(v1_user_path(other_user)) }
      
            it { expect(response).to have_http_status(:unauthorized) }
        end
    end

    describe 'PATCH /v1/users/:id' do
        let(:other_user) { create(:user, first_name: 'John', last_name: 'Doe') }

      context 'as an admin' do
          let(:user) { create(:admin) }
          let(:params) do
              {
                first_name: 'Jane',
                last_name: 'Deer'
              }
          end

          before { patch(v1_user_path(other_user), params: params, headers: headers) }

          it { expect(response).to have_http_status(:ok) }
          it { expect(json).to conform_to_json_schema('v1/user') }
        end

        context 'as a non-admin' do
            let(:user) { create(:user, admin: false) }

            before { patch(v1_user_path(other_user), headers: headers) }

            it { expect(response).to have_http_status(:forbidden) }
        end

        context 'as an anonymous user' do
          before { patch(v1_user_path(other_user)) }

          it { expect(response).to have_http_status(:unauthorized) }
        end
    end

    describe 'DELETE /v1/users/:id' do
        let(:deletable_user) { create(:user) }

        context 'admin can delete user account' do
            let (:admin) { create(:admin) }

            before { delete(v1_user_path(deletable_user), headers: headers) }

            it { expect(response).to have_http_status(:no_content) }
            it { expect(User.where(id: deletable_user.id)).not_to exist }
        end

        context 'non-admin can delete own account' do
            let (:restauranteur_user) { create(:restauranteur) }

            before { delete(v1_user_path(restauranteur_user), headers: headers ) }
            
            it { expect(response).to have_http_status(:no_content) }
            it { expect(User.where(id: restauranteur_user.id)).not_to exist}
        end
    end
end