defmodule Data.Migrations.AddSenderNameToMessages do
  use Ecto.Migration

  def up do
	"ALTER TABLE messages ADD COLUMN sender_name TEXT"
  end

  def down do
    "ALTER TABLE messages DROP COLUMN IF EXISTS sender_name"
  end
end
