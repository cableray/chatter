defmodule Chatter.Message do
  use Ecto.Model

  schema "messages" do
    field :body,        :string
    field :sent_at,     :datetime
    field :topic,       :string
    field :sender_name, :string
  end
end