defmodule LiveviewWeb.HelloHTML do
  use LiveviewWeb, :html

    def index(assigns) do
    ~H"""
    Hello!
    """
  end
end
