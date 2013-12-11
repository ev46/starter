class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :email
      t.boolean :confirmed, :default => false
      t.string :confirmation_token

      t.timestamps
    end
  end
end
