class DropTable < ActiveRecord::Migration
  def up
		drop_table :notes
	end

  def down
  end
end
