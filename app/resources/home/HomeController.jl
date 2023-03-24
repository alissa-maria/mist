module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, layout = :home, title = "home")
end

function tools()
  html(:home, :tools, title = "tools", sdate = "")
end

function contact()
  html(:home, :contact, title = "contact", sdate = "")
end

end
