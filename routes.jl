using Genie.Router, Motregen.HomeController, Motregen.CommentsController

route("/", HomeController.index)

# route("/create_comment", CommentsController.create, method = POST, named = :create_comment)

route("/guestbook", CommentsController.guestbook)