class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string        :name,            null: false
      t.text          :description,     null: false
      t.integer       :category_id,     null: false
      t.integer       :status_id,       null: false
      t.integer       :shipping_id,     null: false
      t.integer       :prefecture_id,   null: false
      t.integer       :money,           null: false
      t.integer       :charge_id,       null: false
      t.references    :user,            foreign_key: true, null:false
      t.timestamps
    end
  end
end
