class AddVisitToUsers < ActiveRecord::Migration
  def change
		add_column :users, :visit, :integer
	end
end
