class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :uid
      t.string :token_a
      t.string :token_b
      t.string :board

      t.timestamps
    end
  end
end
