class AddSituationAndGenderAndColorToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :situation, :string
	
		
	end
end
