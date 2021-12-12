defmodule BowlingGame.Authentication do
  alias BowlingGame.Guardian

  def check_credentials(user, username) do
    IO.puts("1")
    if user && user.username == username do
      {:ok, user}
    else
      {:error, :unauthorized_user}
    end
  end

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user)
  end

  def logout(conn) do
    IO.puts("2")
    conn
    |> Guardian.Plug.sign_out()
  end

  def load_current_user(conn) do
    Guardian.Plug.current_resource(conn)
  end
end
