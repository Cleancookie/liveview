defmodule LiveviewWeb.HelloController do
  use LiveviewWeb, :controller

  # It is convention to prefix with _ if we are not using that arg
  def index(conn, _params) do
    render(conn, :index)
  end
end
