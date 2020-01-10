defmodule Tick.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")
    create table(:tickets) do
      add :refNo, :uuid, default: fragment("uuid_generate_v4()")
      add :subject, :string
      add :name, :string
      add :assignee, :string
      add :status, :string
      add :email_address, :string

      timestamps()
    end

    create unique_index(:tickets, [:name])
  end
end
