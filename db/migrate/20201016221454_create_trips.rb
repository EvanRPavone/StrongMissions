class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :group_name
      t.string :email
      t.date :when
      t.string :jobs
      t.string :escursions
      t.string :additional_info

      t.timestamps
    end
  end
end
