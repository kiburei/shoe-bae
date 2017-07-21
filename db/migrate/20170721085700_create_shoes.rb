class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:label, :string)
      t.column(:size, :string)
      t.column(:color, :string)
      t.timestamps
    end
  end
end
