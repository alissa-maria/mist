module HomeController

using Genie.Renderer.Html, SearchLight

function index()
  html(:home, :index, title = "Home")
end

function about()
  html(:home, :about, title = "About me")
end

function sitemap()
  html(:home, :sitemap, title = "Site map")
end

function contact()
  html(:home, :contact, title = "Contact")
end

end
