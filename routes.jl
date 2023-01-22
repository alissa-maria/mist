using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController, Motregen.CommentsController

route("/", HomeController.index)

route("/tools", HomeController.tools)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

# BlogController.initialize()

route("/index", BlogController.index, named = :get_posts)

# route("/posts/:link", named = :get_post) do 
#     BlogController.blogpost(payload(:link))
# end

# route("/search_posts", BlogController.search, named = :search_posts)
# # route("blog/:tag", named = :filter_posts) do 
# #     BlogController.filter(payload(:tag))
# # end

# route("/guestbook", CommentsController.guestbook)
# route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
