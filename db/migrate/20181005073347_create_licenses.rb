class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.integer :license_no
      t.string :license_image
      t.string :rto_office
      t.integer :user_id, :null => false, :references => [:users, :id]
      
      t.timestamps
    end
  end
end
