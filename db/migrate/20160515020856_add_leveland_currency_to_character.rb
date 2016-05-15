class AddLevelandCurrencyToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :level, :string, default: "1"
    add_column :characters, :currency, :string, default: "0"
  end
end
