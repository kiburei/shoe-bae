class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories) do |t|
      t.column(:type, :string)
      t.timestamps
    end
  end
end
