class CreateWebhookActions < ActiveRecord::Migration[5.2]
  def change
    create_table :webhook_actions do |t|
      t.string :title
      t.string :script_type
      t.text :script

      t.timestamps
    end
  end
end
