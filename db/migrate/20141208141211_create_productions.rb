class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :pid
      t.string :registration_code
      t.string :description
      t.string :production_type
      t.string :highest_yield
      t.string :lowest_yield
      t.string :real_yield
      t.string :starting_amount
      t.string :status
      t.string :start_date
      t.string :end_date
      t.string :term
      t.string :issuer_code
      t.string :issuer_name
      t.string :currency
      t.string :collection_start_date
      t.string :collection_end_date
      t.string :term_type
      t.string :incoming_type
      t.string :risk_level
      t.string :initial_value
      t.string :production_value
      t.text :sales_area

      t.timestamps
    end
  end
end
