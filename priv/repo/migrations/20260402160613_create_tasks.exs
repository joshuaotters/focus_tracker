defmodule FocusTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :status, :string
      add :project_id, references(:projects, on_delete: :nothing)
      add :user_id, references(:users, type: :id, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:tasks, [:user_id])

    create index(:tasks, [:project_id])
  end
end
