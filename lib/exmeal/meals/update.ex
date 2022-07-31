defmodule Exmeal.Meals.Update do
  alias Ecto.UUID
  alias Exmeal.{Error, Repo, Meal}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, "!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, %Error{result: "Meal not found", status: :not_found}}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
