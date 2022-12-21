module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, title = "Home")
end

function contact()
  html(:home, :contact, title = "Contact")
end

function nse()
  html(:home, :nse, title = "Not Software Engineering")
end

end
