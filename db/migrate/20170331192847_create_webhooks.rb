class CreateWebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :webhooks do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
    add_index :webhooks, :name
    add_index :webhooks, :token
  end
end
