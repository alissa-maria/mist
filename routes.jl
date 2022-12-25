using Genie.Router, Motregen.HomeController, Motregen.CommentsController

route("/", HomeController.index)

route("/about", HomeController.about)

route("/site%20map", HomeController.sitemap)

route("/contact", HomeController.contact)

route("/art") do 
    serve_static_file("gallery.html")
end

route("/guestbook", CommentsController.guestbook)
route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
