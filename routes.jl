using Genie.Router, Genie.Requests, Motregen.HomeController, Motregen.BlogController, Motregen.CommentsController

route("/", HomeController.index)

route("/tools", HomeController.tools)

route("/site-map", HomeController.sitemap)

route("/contact", HomeController.contact)

BlogController.initialize()

route("/index", BlogController.index, named=:get_posts)

for post in BlogController.Posts
    route("/" * post.link) do 
        BlogController.blogpost(post.link)
    end
end

# route("/search_posts", BlogController.search, named = :search_posts)
# # route("blog/:tag", named = :filter_posts) do 
# #     BlogController.filter(payload(:tag))
# # end

# route("/guestbook", CommentsController.guestbook)
# route("/create_comment", CommentsController.create, method = POST, named = :create_comment)
