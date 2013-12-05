class AddIntroToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :intro, :string
	end
end
