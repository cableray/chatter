defmodule Chatter.Message do
  use Ecto.Model

  schema "messages" do
    field :body,        :string
    field :topic,       :string
    field :sender_name, :string
  timestamps inserted_at: :sent_at, updated_at: false
  end

end