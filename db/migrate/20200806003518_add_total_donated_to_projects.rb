class AddTotalDonatedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :total_donated, :integer, default: 0
  end
end
