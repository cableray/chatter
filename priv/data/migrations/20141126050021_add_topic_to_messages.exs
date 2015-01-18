defmodule Data.Migrations.AddTopicToMessages do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    execute "ALTER TABLE messages ADD COLUMN topic CITEXT NOT NULL DEFAULT 'Lobby'"
  end

  def down do
    execute "ALTER TABLE messages DROP COLUMN IF EXISTS topic"
  end
end
