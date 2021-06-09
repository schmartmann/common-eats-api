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

    ROLES.each do |role|
        scope role.to_s.pluralize.to_sym, -> { where(role => true) }
    end

    scope :with_role, ->(role) { where(role => true) if role.to_sym.in?(ROLES) }
    
    has_secure_password

    has_many :sessions, dependent: :destroy, inverse_of: :user

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :email, presence: true


    def role?(role)
        role.to_sym.in?(ROLES) && send(:"#{role}?")
    end

    def roles
        ROLES.select { |role| send(role) }
    end

    def roles=(roles)
        roles = roles.map(&:to_sym)
        ROLES.each { |role| send(:"#{role}=", role.in?(roles)) }
    end
end
