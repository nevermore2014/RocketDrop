class CreateGmail < ActiveRecord::Migration
  def change
    create_table :gmails do |t|
      t.text :email
      t.text :name

      t.timestamps
    end
  end
end
