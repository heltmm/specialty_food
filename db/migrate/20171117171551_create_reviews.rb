class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content_body, :string
      t.column :rating, :integer
    end
  end
end
