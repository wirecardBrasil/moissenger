class AddColumnsProviderAndUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :providers, :string
    add_column :users, :uid, :string
  end
end
