using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController

BlogController.initialize()

route("/", HomeController.index)

route("/tools", HomeController.tools)

route("/over-mij", HomeController.over)

route("/contact", HomeController.contact)

route("/index", BlogController.index)

categories = ["kunst", "colofon"]

for categorie in categories
    route("/" * categorie) do 
        BlogController.index_category(categorie)
    end 
end

for post in BlogController.Posts
    route("/" * post.link) do 
        BlogController.blogpost(post.link)
    end
end
