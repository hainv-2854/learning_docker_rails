class ChangeIsSendEmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  # def initialize args = {}
  #   @user = args[:user]
  # end

  def perform
    # byebug
    redis = Redis.new
    user_id = redis.get("user_id").to_i
    # p "1231232131232323---------1231283238238"
    User.find(user_id).update(is_sent_email: true)
    redis.del("user_id")
  end
end
