using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController, Motregen.CommentsController, Motregen.IllustrationsController

route("/", HomeController.index)

route("/about", HomeController.about)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

route("/art") do 
    serve_static_file("gallery.html")
end

BlogController.initialize()

route("/blog", BlogController.index)

# for_each(BlogController.Posts) do pst 
#     route("/blog/" + pst.link, BlogController.post(pst.link))
# end

# route("/blog/:link") do 
#     BlogController.post(getpayload(:link))
# end

route("/guestbook", CommentsController.guestbook)
route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
