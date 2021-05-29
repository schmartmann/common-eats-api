# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :boolean
#  customer        :boolean
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone           :string
#  restauranteur   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    include User::Admin
    include User::Customer
    include User::Restauranteur

    ROLES = %i[customer restauranteur admin].freeze
end
