class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.references :user, foreign_key: true
      t.string :valName1
      t.string :valCat1
      t.string :valUPE1
      t.string :valName2
      t.string :valCat2
      t.string :valUPE2
      t.string :valSpeed
      t.string :valSclass
      t.string :valSlevel
      t.string :valContract
      t.string :valScat
      t.string :valSdiscount
      t.string :valStype
      t.string :valSdistance
      t.string :valRouter
      t.string :valRbom
      t.string :valRquantity
      t.string :valRdiscount
      t.string :valRwiring
      t.string :valStatus
      t.string :valUname
      t.string :valUphone
      t.string :valUfax
      t.string :valUemail

      t.timestamps
    end
  end
end
