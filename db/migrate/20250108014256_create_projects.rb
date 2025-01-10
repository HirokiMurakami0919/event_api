# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
