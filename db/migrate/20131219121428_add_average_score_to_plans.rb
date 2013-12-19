class AddAverageScoreToPlans < ActiveRecord::Migration
  def change
		add_column :plans, :avarage_score, :float
	end
end
