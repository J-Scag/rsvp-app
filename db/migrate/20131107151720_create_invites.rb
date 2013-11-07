class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :event, index: true
      t.references :user, index: true
    end
  end
end
