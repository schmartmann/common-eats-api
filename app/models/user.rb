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
class User < ApplicationRecord
    include User::Admin
    include User::Customer
    include User::Restauranteur

    ROLES = %i[customer restauranteur admin].freeze

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :email, presence: true
end
