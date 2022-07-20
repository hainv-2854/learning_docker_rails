class User < ApplicationRecord
  after_create :update_is_sent_email

  private
  def update_is_sent_email
    self.is_sent_email = true
  end
end
