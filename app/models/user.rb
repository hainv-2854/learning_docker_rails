class User < ApplicationRecord
  # after_create :update_is_sent_email

  has_secure_password

  private
  def update_is_sent_email
    # ChangeIsSendEmailWorker.new(user: self).perform_at(15.seconds.from_now)
    # ChangeIsSendEmailWorker.perform_at(15.seconds.from_now, self.id)
    redis = Redis.new
    redis.set("user_id", self.id)
  end
end
