defmodule FocusTracker.TasksTest do
  use FocusTracker.DataCase

  alias FocusTracker.Tasks

  describe "tasks" do
    alias FocusTracker.Tasks.Task

    import FocusTracker.AccountsFixtures, only: [user_scope_fixture: 0]
    import FocusTracker.TasksFixtures

    @invalid_attrs %{status: nil, description: nil, title: nil}

    test "list_tasks/1 returns all scoped tasks" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      task = task_fixture(scope)
      other_task = task_fixture(other_scope)
      assert Tasks.list_tasks(scope) == [task]
      assert Tasks.list_tasks(other_scope) == [other_task]
    end

    test "get_task!/2 returns the task with given id" do
      scope = user_scope_fixture()
      task = task_fixture(scope)
      other_scope = user_scope_fixture()
      assert Tasks.get_task!(scope, task.id) == task
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(other_scope, task.id) end
    end

    test "create_task/2 with valid data creates a task" do
      valid_attrs = %{status: "some status", description: "some description", title: "some title"}
      scope = user_scope_fixture()

      assert {:ok, %Task{} = task} = Tasks.create_task(scope, valid_attrs)
      assert task.status == "some status"
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.user_id == scope.user.id
    end

    test "create_task/2 with invalid data returns error changeset" do
      scope = user_scope_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(scope, @invalid_attrs)
    end

    test "update_task/3 with valid data updates the task" do
      scope = user_scope_fixture()
      task = task_fixture(scope)
      update_attrs = %{status: "some updated status", description: "some updated description", title: "some updated title"}

      assert {:ok, %Task{} = task} = Tasks.update_task(scope, task, update_attrs)
      assert task.status == "some updated status"
      assert task.description == "some updated description"
      assert task.title == "some updated title"
    end

    test "update_task/3 with invalid scope raises" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      task = task_fixture(scope)

      assert_raise MatchError, fn ->
        Tasks.update_task(other_scope, task, %{})
      end
    end

    test "update_task/3 with invalid data returns error changeset" do
      scope = user_scope_fixture()
      task = task_fixture(scope)
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(scope, task, @invalid_attrs)
      assert task == Tasks.get_task!(scope, task.id)
    end

    test "delete_task/2 deletes the task" do
      scope = user_scope_fixture()
      task = task_fixture(scope)
      assert {:ok, %Task{}} = Tasks.delete_task(scope, task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(scope, task.id) end
    end

    test "delete_task/2 with invalid scope raises" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      task = task_fixture(scope)
      assert_raise MatchError, fn -> Tasks.delete_task(other_scope, task) end
    end

    test "change_task/2 returns a task changeset" do
      scope = user_scope_fixture()
      task = task_fixture(scope)
      assert %Ecto.Changeset{} = Tasks.change_task(scope, task)
    end
  end
end
