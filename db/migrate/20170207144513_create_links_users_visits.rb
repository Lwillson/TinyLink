class CreateLinksUsersVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
    	t.text :url

    	t.timestamps
    end

    create_table :users do |t|
    	t.text :name

    	t.timestamps
    end

    create_table :visits do |t|
    	t.integer :link_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
