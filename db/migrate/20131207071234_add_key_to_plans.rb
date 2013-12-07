class AddKeyToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :key, :string
	end
end
