using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController

route("/", HomeController.index)

route("/tools", HomeController.tools)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

BlogController.htmlposts()
BlogController.mdposts()

route("/index", BlogController.index)

for post in BlogController.Posts
    route("/" * post.link) do 
        BlogController.blogpost(post.link)
    end
end
