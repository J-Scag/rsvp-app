class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :host
      t.string :date

      t.timestamps
    end
  end
end
