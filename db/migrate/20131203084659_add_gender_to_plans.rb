class AddGenderToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :gender, :string
	end
end
