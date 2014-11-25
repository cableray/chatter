defmodule Data.Migrations.AddMessagesTable do
  use Ecto.Migration

  def up do
    "CREATE TABLE messages (id serial, body varchar NOT NULL, sent_at timestamp DEFAULT CURRENT_TIMESTAMP)"
  end

  def down do
    "DROP TABLE messages"
  end
end
