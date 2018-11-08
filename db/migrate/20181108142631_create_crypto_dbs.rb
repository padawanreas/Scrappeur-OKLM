class CreateCryptoDbs < ActiveRecord::Migration[5.2]
  def change
    create_table :crypto_dbs do |t|
      t.string :money
      t.string :value
      
    end
  end
end
