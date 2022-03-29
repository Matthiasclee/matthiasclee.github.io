class AddConferenceToTalk < ActiveRecord::Migration[6.1]
  def change
    add_column :talks, :conference, :string
  end
end
