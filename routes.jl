using Genie.Router, Motregen.HomeController, Motregen.BlogController, Motregen.CommentsController, Motregen.IllustrationsController

route("/", HomeController.index)

route("/about", HomeController.about)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

route("/art") do 
    serve_static_file("gallery.html")
end

route("/blog", BlogController.index)

route("/guestbook", CommentsController.guestbook)
route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
