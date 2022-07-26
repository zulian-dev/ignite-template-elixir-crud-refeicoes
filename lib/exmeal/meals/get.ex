defmodule Exmeal.Meals.Get do
  alias Ecto.UUID
  alias Exmeal.{Error, Repo, Meal}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, "!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}
      meal -> {:ok, meal}
    end
  end
end
