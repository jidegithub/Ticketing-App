defmodule TickWeb.TicketControllerTest do
  use TickWeb.ConnCase

  alias Tick.Customer
  alias Tick.Customer.Ticket

  @create_attrs %{
    Assignee: "some Assignee",
    Status: "some Status",
    Subject: "some Subject",
    name: "some name",
    refNo: "some refNo"
  }
  @update_attrs %{
    Assignee: "some updated Assignee",
    Status: "some updated Status",
    Subject: "some updated Subject",
    name: "some updated name",
    refNo: "some updated refNo"
  }
  @invalid_attrs %{Assignee: nil, Status: nil, Subject: nil, name: nil, refNo: nil}

  def fixture(:ticket) do
    {:ok, ticket} = Customer.create_ticket(@create_attrs)
    ticket
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tickets", %{conn: conn} do
      conn = get(conn, Routes.ticket_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ticket" do
    test "renders ticket when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ticket_path(conn, :create), ticket: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.ticket_path(conn, :show, id))

      assert %{
               "id" => id,
               "Assignee" => "some Assignee",
               "Status" => "some Status",
               "Subject" => "some Subject",
               "name" => "some name",
               "refNo" => "some refNo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ticket_path(conn, :create), ticket: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ticket" do
    setup [:create_ticket]

    test "renders ticket when data is valid", %{conn: conn, ticket: %Ticket{id: id} = ticket} do
      conn = put(conn, Routes.ticket_path(conn, :update, ticket), ticket: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.ticket_path(conn, :show, id))

      assert %{
               "id" => id,
               "Assignee" => "some updated Assignee",
               "Status" => "some updated Status",
               "Subject" => "some updated Subject",
               "name" => "some updated name",
               "refNo" => "some updated refNo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ticket: ticket} do
      conn = put(conn, Routes.ticket_path(conn, :update, ticket), ticket: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ticket" do
    setup [:create_ticket]

    test "deletes chosen ticket", %{conn: conn, ticket: ticket} do
      conn = delete(conn, Routes.ticket_path(conn, :delete, ticket))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.ticket_path(conn, :show, ticket))
      end
    end
  end

  defp create_ticket(_) do
    ticket = fixture(:ticket)
    {:ok, ticket: ticket}
  end
end
