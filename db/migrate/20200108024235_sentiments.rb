class Sentiments < ActiveRecord::Migration[5.2]
  def change
    create_table :sentiments do |t|
      t.float :anger
      t.float :fear
      t.float :joy
      t.float :sadness
      t.float :analytical
      t.float :confident
      t.float :tentative
   end
  end
end
