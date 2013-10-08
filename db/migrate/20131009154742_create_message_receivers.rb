class CreateMessageReceivers < ActiveRecord::Migration
  def change
    create_table :message_receivers do |t|
      t.references :message, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
