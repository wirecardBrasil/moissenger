class RemoveErrorColumnFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x00000004267308>"
  end
end
