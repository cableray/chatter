defmodule Chatter.Message do
  use Ecto.Model

  schema "messages" do
    field :body,    :string
    field :sent_at, :datetime
  end
end