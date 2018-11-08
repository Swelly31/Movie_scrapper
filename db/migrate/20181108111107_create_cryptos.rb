class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.text :currency
      t.text :price

      t.timestamps
    end
  end
end
