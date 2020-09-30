class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string     :first_name,         null: false, default: ""
      t.string     :last_name,          null: false, default: ""
      t.string     :first_name_reading, null: false, default: ""
      t.string     :last_name_reading,  null: false, default: ""
      t.date       :birthday,           null: false
      t.string     :hobby,              default: ""
      t.text       :free_space,         null: false
      t.string     :email,              default: ""
      t.references :user,               foreign_key: true
      t.timestamps
    end
  end
end
