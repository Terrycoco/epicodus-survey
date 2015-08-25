class CreateSurveys < ActiveRecord::Migration
  def change
    create_table(:surveys) do |s|
      s.column(:title, :string)
      s.timestamps
    end
  end
end
