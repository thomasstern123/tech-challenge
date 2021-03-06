defmodule EfoodWeb do
  @moduledoc """
  The entrypoint for defining web interface (controllers, views, etc.)

  This can be used in the application as:

      use EfoodWeb, :controller
      use EfoodWeb, :view

  The definitions below will be executed for every view,
  controller, etc.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: EfoodWeb
      alias Efood.Repo
      import Ecto
      import Ecto.Query
      import Plug.Conn
      import EfoodWeb.Gettext
      alias EfoodWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/efood_web/templates",
        namespace: EfoodWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import EfoodWeb.ErrorHelpers
      import EfoodWeb.Gettext
      alias EfoodWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import EfoodWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
