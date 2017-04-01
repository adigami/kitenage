class CreateAdAccounts < ActiveRecord::Migration
  def change
    create_table :ad_accounts do |t|
      t.string :name
      t.integer :source_id
      t.string :oauth_token
      t.boolean :active
      t.references :user, index: true

      t.timestamps
    end
  end
end
