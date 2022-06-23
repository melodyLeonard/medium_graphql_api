defmodule MediumGraphqlApiWeb.Resolvers.UserResolver do
  alias MediumGraphqlApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: input}, _) do
    case Accounts.create_user(input) do
      {:ok, %Accounts.User{}} -> {:ok, %Accounts.User{}}
      _ -> {:error, "User could not be created"}
    end
  end
end
