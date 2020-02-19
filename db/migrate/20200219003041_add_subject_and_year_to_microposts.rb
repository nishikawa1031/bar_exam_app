class AddSubjectAndYearToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :subject, :integer
    add_column :microposts, :year, :integer
  end
end
