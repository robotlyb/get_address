class AddYearsOldToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :years_old, :string
	end
end
