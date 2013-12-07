class AddVisitToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :visit, :integer
	end

end
