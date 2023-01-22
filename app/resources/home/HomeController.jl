module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, layout = :home, title = "home")
end

function tools()
  html(:home, :tools, title = "tools")
end

function sitemap()
  html(:home, :sitemap, title = "site map")
end

function contact()
  html(:home, :contact, title = "contact")
end

end
