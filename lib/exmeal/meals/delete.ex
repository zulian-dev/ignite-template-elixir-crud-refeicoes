defmodule Exmeal.Meals.Delete do
  alias Ecto.UUID
  alias Exmeal.{Error, Repo, Meal}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Error{result: "Meal not found", status: :not_found}}
      meal -> Repo.delete(meal)
    end
  end
end
