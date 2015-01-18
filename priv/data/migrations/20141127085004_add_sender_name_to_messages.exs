defmodule Data.Migrations.AddSenderNameToMessages do
  use Ecto.Migration

  def up do
	execute "ALTER TABLE messages ADD COLUMN sender_name TEXT"
  end

  def down do
    execute "ALTER TABLE messages DROP COLUMN IF EXISTS sender_name"
  end
end
