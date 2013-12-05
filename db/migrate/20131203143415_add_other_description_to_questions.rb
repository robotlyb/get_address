class AddOtherDescriptionToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :other_description, :string
	end
end
