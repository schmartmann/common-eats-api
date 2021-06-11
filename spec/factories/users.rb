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

FactoryBot.define do 
    factory :user do 
        first_name { Faker::Name.first_name   }
        last_name  { Faker::Name.last_name    }
        email      { Faker::Internet.email    }
        password   { Faker::Internet.password }
        phone      { '555-212-5555'           }

        factory :admin do 
            admin { true }
        end

        factory :customer do 
            customer { true }
        end

        factory :restauranteur do 
            restauranteur { true }
        end
    end
end