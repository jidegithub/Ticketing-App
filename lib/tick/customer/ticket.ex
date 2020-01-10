defmodule Tick.Customer.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tickets" do
    field :assignee, :string
    field :status, :string
    field :subject, :string
    field :name, :string
    field :refNo, :string
    field :email_address, :string

    timestamps()
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:refNo, :subject, :name, :assignee, :status, :email_address])
    |> validate_required([:refNo, :subject, :name, :assignee, :status, :email_address])
    |> unique_constraint(:name)
  end

  # defp add_refno(changeset)  do
  #   prefix = "ABC-"
  #   refno = :rand.uniform()
  #   |> to_string
  #   |> String.replace(".", "")
  # end
end
