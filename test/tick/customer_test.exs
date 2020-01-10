defmodule Tick.CustomerTest do
  use Tick.DataCase

  alias Tick.Customer

  describe "tickets" do
    alias Tick.Customer.Ticket

    @valid_attrs %{Assignee: "some Assignee", Status: "some Status", Subject: "some Subject", name: "some name", refNo: "some refNo"}
    @update_attrs %{Assignee: "some updated Assignee", Status: "some updated Status", Subject: "some updated Subject", name: "some updated name", refNo: "some updated refNo"}
    @invalid_attrs %{Assignee: nil, Status: nil, Subject: nil, name: nil, refNo: nil}

    def ticket_fixture(attrs \\ %{}) do
      {:ok, ticket} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Customer.create_ticket()

      ticket
    end

    test "list_tickets/0 returns all tickets" do
      ticket = ticket_fixture()
      assert Customer.list_tickets() == [ticket]
    end

    test "get_ticket!/1 returns the ticket with given id" do
      ticket = ticket_fixture()
      assert Customer.get_ticket!(ticket.id) == ticket
    end

    test "create_ticket/1 with valid data creates a ticket" do
      assert {:ok, %Ticket{} = ticket} = Customer.create_ticket(@valid_attrs)
      assert ticket.Assignee == "some Assignee"
      assert ticket.Status == "some Status"
      assert ticket.Subject == "some Subject"
      assert ticket.name == "some name"
      assert ticket.refNo == "some refNo"
    end

    test "create_ticket/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customer.create_ticket(@invalid_attrs)
    end

    test "update_ticket/2 with valid data updates the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{} = ticket} = Customer.update_ticket(ticket, @update_attrs)
      assert ticket.Assignee == "some updated Assignee"
      assert ticket.Status == "some updated Status"
      assert ticket.Subject == "some updated Subject"
      assert ticket.name == "some updated name"
      assert ticket.refNo == "some updated refNo"
    end

    test "update_ticket/2 with invalid data returns error changeset" do
      ticket = ticket_fixture()
      assert {:error, %Ecto.Changeset{}} = Customer.update_ticket(ticket, @invalid_attrs)
      assert ticket == Customer.get_ticket!(ticket.id)
    end

    test "delete_ticket/1 deletes the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{}} = Customer.delete_ticket(ticket)
      assert_raise Ecto.NoResultsError, fn -> Customer.get_ticket!(ticket.id) end
    end

    test "change_ticket/1 returns a ticket changeset" do
      ticket = ticket_fixture()
      assert %Ecto.Changeset{} = Customer.change_ticket(ticket)
    end
  end
end
