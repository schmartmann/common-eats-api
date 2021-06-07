# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
    attribute :session, :user
  
    def user?
      user.present?
    end
  
    def session=(session)
      super
      self.user = session&.user
    end
  end
  