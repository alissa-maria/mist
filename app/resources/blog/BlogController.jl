module BlogController

using Dates, YAML

struct Post
  title::String
  description::String
  tags::Array{String}
  date::Date
  link::String
  filename::String
end

Posts = Vector{Post}()

function index()
  post_names = readdir("app/resources/blog/posts")
  for_each(post_names) do post_name
    data = YAML.load_file("app/resources/blog/posts/" * post_name)
    tags = split(data["tags"], ", ")
    push!(Posts, Post(data["title"], data["description"], tags, data["date"], data["link"], post_name))
  end

  # print(Posts)
  # html(:blog, :index, title = "Blog")
end

end
