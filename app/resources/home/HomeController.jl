module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, title = "home")
end

end
