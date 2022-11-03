module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, title = "home")
  # html(:home, :index, comments = all(Comment, order = SQLOrder(:created_at, "DESC")), title = "home")
  # html(:home, :index, comments = all(Comment, SQLQuery(where = [SQLWhereExpression("page = '/'")], order = SQLOrder(:created_at, "DESC"))), title = "home")
end

end
