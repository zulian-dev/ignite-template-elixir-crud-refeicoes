defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields ~w[ description date calories]a
  @required_params @fields
  @required_update @required_params

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_params)

    # |> validate_fields()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required_update)

    # |> validate_fields()
  end

  # defp validate_fields(struct) do
  #   struct
  #   |> validate_length(:password, min: 6)
  #   |> validate_length(:cep, is: 8)
  #   |> validate_length(:cpf, is: 11)
  #   |> validate_number(:age, greater_than_or_equal_to: 18)
  #   |> validate_format(:email, ~r/@/)
  #   |> unique_constraint([:cpf])
  #   |> unique_constraint([:email])
  #   |> put_password_hash()
  # end
end
