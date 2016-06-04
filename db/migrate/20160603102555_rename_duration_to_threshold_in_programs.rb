class RenameDurationToThresholdInPrograms < ActiveRecord::Migration[5.0]
  def change
    rename_column :programs, :duration, :threshold
  end
end
