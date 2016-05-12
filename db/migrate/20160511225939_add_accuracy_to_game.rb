class AddAccuracyToGame < ActiveRecord::Migration
  def change
  	add_column :games, :accuracy, :decimal, :precision => 5, :scale => 2
  end
end
