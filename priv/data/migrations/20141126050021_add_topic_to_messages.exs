defmodule Data.Migrations.AddTopicToMessages do
  use Ecto.Migration

  def up do
    [
    	"CREATE EXTENSION IF NOT EXISTS citext",
    	"ALTER TABLE messages ADD COLUMN topic CITEXT NOT NULL DEFAULT 'Lobby'"
	]
  end

  def down do
    "ALTER TABLE messages DROP COLUMN IF EXISTS topic"
  end
end
