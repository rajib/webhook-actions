class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.references :webhook_action
      t.text :build_info

      t.timestamps
    end
  end
end
