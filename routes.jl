using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController, Motregen.CommentsController, Motregen.IllustrationsController

route("/", HomeController.index)

route("/about", HomeController.about)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

route("/art") do 
    serve_static_file("gallery.html")
end

BlogController.initialize()

route("/blog", BlogController.index, named = :get_posts)
route("/search_posts", BlogController.search, named = :search_posts)

route("/blog/:link", named = :get_post) do 
    BlogController.blogpost(payload(:link))
end

route("/guestbook", CommentsController.guestbook)
route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
