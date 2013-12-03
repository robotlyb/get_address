class AddColorToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :color, :string
	end
end
