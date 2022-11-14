module CommentsController

using Genie, Genie.Renderer, Genie.Requests, SearchLight, Markdown
using Motregen.Comments

function index()
  html(:home, :index, title = "home")
  html(:comments, :guestbook, comments = all(Comment), layout = :empty)
  # html(:home, :index, comments = all(Comment, order = SQLOrder(:id, "DESC")))
  # html(:home, :index, comments = all(Comment, SQLQuery(where = [SQLWhereExpression("page = '/'")], order = SQLOrder(:created_at, "DESC"))), title = "home")
end

function create()
  sanitized_text = Markdown.htmlesc(postpayload(:text)) |> strip
  Comment(name = postpayload(:name), text = sanitized_text, page = postpayload(:page)) |> save && redirect("/guestbook") 
end

end
