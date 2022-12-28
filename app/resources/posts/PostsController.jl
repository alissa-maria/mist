module PostsController

using Genie.Renderer.Html, Dates

struct Post
  title::String
  description::String
  text::String
  tags::Vector{String}
  created_at::DateTime
  last_edited::DateTime
end

function index()
  posts = readdir("app/resources/posts/views")
end

end