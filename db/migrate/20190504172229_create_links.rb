class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :shortened_url
      t.datetime :expires_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
