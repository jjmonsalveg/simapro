class CreateTipoBosques < ActiveRecord::Migration
  def change
    create_table :tipo_bosques do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
