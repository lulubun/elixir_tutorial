defmodule Discuss.PageController do

#default created controller - no longer in use
  use Discuss.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
