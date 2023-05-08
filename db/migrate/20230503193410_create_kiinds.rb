class CreateKiinds < ActiveRecord::Migration[7.0]
  def change
    create_table :kiinds do |t|
      t.string :description

      t.timestamps
    end
  end
end
