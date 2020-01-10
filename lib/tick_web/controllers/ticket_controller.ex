defmodule TickWeb.TicketController do
  use TickWeb, :controller

  alias Tick.Customer
  alias Tick.Customer.Ticket

  action_fallback TickWeb.FallbackController

  def index(conn, _params) do
    tickets = Customer.list_tickets()
    render(conn, "index.json", tickets: tickets)
  end

  def create(conn, %{"ticket" => ticket_params}) do
    with {:ok, %Ticket{} = ticket} <- Customer.create_ticket(ticket_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.ticket_path(conn, :show, ticket))
      |> render("show.json", ticket: ticket)
    end
  end

  # def create(conn, %{"ticket" => ticket_params}) do
  #   IO.inspect ticket_params
  #   case Customer.create_ticket(ticket_params) do
  #     {:ok, ticket} ->
  #       conn
  #       |> json(ticket)

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       conn |> json("Not working")
  #   end

  

  def show(conn, %{"id" => id}) do
    ticket = Customer.get_ticket!(id)
    render(conn, "show.json", ticket: ticket)
  end

  def update(conn, %{"id" => id, "ticket" => ticket_params}) do
    ticket = Customer.get_ticket!(id)

    with {:ok, %Ticket{} = ticket} <- Customer.update_ticket(ticket, ticket_params) do
      render(conn, "show.json", ticket: ticket)
    end
  end

  def delete(conn, %{"id" => id}) do
    ticket = Customer.get_ticket!(id)

    with {:ok, %Ticket{}} <- Customer.delete_ticket(ticket) do
      send_resp(conn, :no_content, "")
    end
  end
end
