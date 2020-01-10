defmodule TickWeb.TicketView do
  use TickWeb, :view
  alias TickWeb.TicketView

  def render("index.json", %{tickets: tickets}) do
    %{data: render_many(tickets, TicketView, "ticket.json")}
  end

  def render("show.json", %{ticket: ticket}) do
    %{data: render_one(ticket, TicketView, "ticket.json")}
  end

  def render("ticket.json", %{ticket: ticket}) do
    %{id: ticket.id,
      refNo: ticket.refNo,
      subject: ticket.subject,
      name: ticket.name,
      assignee: ticket.assignee,
      status: ticket.status,
      created: ticket.inserted_at
    }
  end
end
