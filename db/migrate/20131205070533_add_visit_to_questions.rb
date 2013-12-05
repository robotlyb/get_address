class AddVisitToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :visit, :integer
	end
end
