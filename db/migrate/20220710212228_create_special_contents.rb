class CreateSpecialContents < ActiveRecord::Migration[7.0]
  def change
    create_table :special_contents do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
