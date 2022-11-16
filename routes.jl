using Genie.Router, Motregen.HomeController, Motregen.CommentsController

route("/", HomeController.index)

route("/gallery") do 
    serve_static_file("gallery.html")
end

route("/guestbook", CommentsController.guestbook)
route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
