module BlogController

using Genie, Genie.Renderer.Html, Dates, YAML

struct Post
  title::String
  description::String
  tags::Array{String}
  date::Date
  link::String
  filename::String
end

Posts = Vector{Post}()

function initialize()
  if (isempty(Posts))
    post_names = readdir("app/resources/blog/posts")
    for_each(post_names) do post_name
      data = YAML.load_file("app/resources/blog/posts/" * post_name)
      tags = split(data["tags"], ", ")
      push!(Posts, Post(data["title"], data["description"], tags, data["date"], data["link"], post_name))
    end
    reverse!(Posts)
  end
end

function index()
  html(:blog, :index, title = "Blog", posts = Posts)
end

function post(link::String)
  pst_index = findfirst(x -> x.link == link, Posts)
  if (!isnothing(pst_index))
    pst = getindex(Posts, pst_index)
    html(pst.filename, title = pst.title)
  end
end

end
