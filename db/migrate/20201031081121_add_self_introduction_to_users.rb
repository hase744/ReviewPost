class AddSelfIntroductionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column:users, :occupation, :string
    add_column:users, :age, :string
    add_column:users, :gender, :string
    add_column:users, :introduction, :text
  end
end
