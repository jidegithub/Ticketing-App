alias Tick.Repo
alias Tick.Customer.Ticket

Repo.insert! %Ticket{
  subject: "subject",
  name: "olutola olajide",
  assignee: "mbonu",
  status: "pending"
}

Repo.insert! %Ticket{
  subject: "subject",
  name: "obafemi ogunmokin",
  assignee: "mbonu",
  status: "pending"
}

Repo.insert! %Ticket{
  subject: "subject",
  name: "adabanya chinedu",
  assignee: "mbonu",
  status: "pending"
}