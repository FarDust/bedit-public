class CreateCommentaries < ActiveRecord::Migration[5.1]
  def change
    create_table(:commentaries) do |t|
      t.string(:text)

      t.timestamps()
    end
  end
end
