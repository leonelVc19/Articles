class AddUserIdToRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :requests, :user, null: false, foreign_key: true, default: 1
  end
end
