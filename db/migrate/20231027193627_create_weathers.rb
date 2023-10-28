class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.string :city
      t.float :temperature
      t.string :description

      t.timestamps
    end
  end
end
