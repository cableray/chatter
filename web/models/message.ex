defmodule Chatter.Message do
  use Ecto.Model

  schema "messages" do
    field :body,    :string
    field :sent_at, :datetime
    field :topic, 	:string
  end
end