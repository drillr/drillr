class AddDefaultValueToSolutions < ActiveRecord::Migration
  def change
    change_column :solutions, :match_type, :string, :default => "exact"
  end
end
