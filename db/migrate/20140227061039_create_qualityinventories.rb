class CreateQualityinventories < ActiveRecord::Migration
  def change
    create_table :qualityinventories do |t|
      t.string :title
      t.string :methodorgadget
      t.string :usefulfor
      t.string :analysisgroup
      t.text :gadgetdescription
      t.decimal :cost
      t.string :companyname
      t.text :companydescription
      t.string :companywebsite
      t.string :techologyused
      t.text :scientficdescription
      t.text :field1explnation
      t.string :field2usefullforwhich
      t.text :field2explanation
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
