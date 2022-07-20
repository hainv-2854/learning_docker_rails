class AddIsSentEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_sent_email, :boolean, default: false
  end
end
