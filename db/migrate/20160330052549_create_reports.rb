class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :c5
      t.float :c36
      t.float :c37
      t.float :c38
      t.float :c41 
      t.float :c83 
    end
  end
end
