defmodule FocusTracker.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FocusTracker.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        description: "some description",
        status: "some status",
        title: "some title"
      })

    {:ok, task} = FocusTracker.Tasks.create_task(scope, attrs)
    task
  end
end
