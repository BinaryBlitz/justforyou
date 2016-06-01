class RenameDurationToLimitInPrograms < ActiveRecord::Migration[5.0]
  def change
    rename_column :programs, :duration, :limit
  end
end
