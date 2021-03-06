defmodule Data.Migrations.AddMessagesTable do
  use Ecto.Migration

  def up do
    execute "CREATE TABLE messages (id serial, body varchar NOT NULL, sent_at timestamp DEFAULT CURRENT_TIMESTAMP)"
  end

  def down do
    execute "DROP TABLE messages"
  end
end
