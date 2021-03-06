defmodule Chatter.View do
  use Phoenix.View, root: "web/templates"

  using do
    quote do
      # This block is expanded within all views for aliases, imports, etc
      import Chatter.Router.Helpers

      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML
    end
  end

  # Functions defined here are available to all other views/templates
end


