class AddColumnToSearches < ActiveRecord::Migration
  def change
		add_column :searches, :user_id, :integer
		add_column :searches, :key, :string
	end
end
