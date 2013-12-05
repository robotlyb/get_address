class AddRememberTokenToQuestions < ActiveRecord::Migration
  def change
		add_column :questions, :token, :string
		add_index :questions, :token
	end
end
