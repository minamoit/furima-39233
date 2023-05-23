class ChangeBirthYearNullabilityInUsers < ActiveRecord::Migration[6.0]
  def change
        change_column_null :users, :birth_year, true
        change_column_null :users, :birth_month, true
        change_column_null :users, :birth_day, true
  end
end
