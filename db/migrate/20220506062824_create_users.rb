class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :sex
      t.string :email
      t.string :prefecture
      t.date   :birthday
      
      t.timestamps
    end
  end
end
