defmodule Tick.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :refNo, :string
      add :subject, :string
      add :name, :string
      add :assignee, :string
      add :status, :string
      add :email_address, :string

      timestamps()
    end

    create unique_index(:tickets, [:email_address, :refNo])
  end
end
