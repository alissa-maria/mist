module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, title = "home")
end

function contact()
  html(:home, :contact, title = "contact")
end

function nse()
  html(:home, :nse, title = "not software engineering")
end

end
