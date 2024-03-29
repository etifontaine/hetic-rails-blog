class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.text :content
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
