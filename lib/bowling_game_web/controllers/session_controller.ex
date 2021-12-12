defmodule BowlingGameWeb.SessionController do

  use BowlingGameWeb, :controller
  alias BowlingGame.{Authentication, Repo}
  alias BowlingGame.User

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => username}}) do
    user = Repo.get_by(User, username: username)
    IO.inspect(user)
    case Authentication.check_credentials(user, username) do
      {:ok, _} ->
        conn
        |> Authentication.login(user)
        |> put_flash(:info, "Welcome #{username}")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error,"Bad User Credentials")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> BowlingGame.Authentication.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
