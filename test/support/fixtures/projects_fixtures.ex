defmodule FocusTracker.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FocusTracker.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        name: "some name"
      })

    {:ok, project} = FocusTracker.Projects.create_project(scope, attrs)
    project
  end
end
