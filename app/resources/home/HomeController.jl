module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, layout = :home)
end

function tools()
  html(:home, :tools, title = "tools")
end

function over()
  html(:home, :over, title = "Over mij")
end

function contact()
  html(:home, :contact, title = "Contact")
end

end
