module BlogController

using Genie.Router, Genie.Renderer.Html, Dates, YAML

struct Post
  title::String
  description::String
  category::String
  date::Date
  link::String
  filename::String
end

Posts = Vector{Post}()

function initialize()
  if (isempty(Posts))
    post_names = readdir("app/resources/blog/views/posts")
    foreach(post_names) do post_name
      data = YAML.load_file("app/resources/blog/views/posts/" * post_name)
      push!(Posts, Post(data["title"], data["description"], data["category"], data["date"], data["link"], post_name))
    end
    reverse!(Posts)
  end
end

function index()
  html(:blog, :index, title="index", posts=Posts, sdate="")
end

function blogpost(link::String)
  post_index = findfirst(x -> x.link == link, Posts)
  post = getindex(Posts, post_index)
  date = Dates.format(post.date, "E, d U Y")
  html(:blog, "posts/" * post.filename, post=post, sdate=date)
end

function search()
  isempty(strip(params(:query))) && redirect(:index)

  results = Vector{Post}()
  query = lowercase(params(:query))

  foreach(Posts) do post
    if (occursin(query, lowercase(post.title)) | occursin(query, lowercase(post.description)))
      push!(results, post)
    end
  end

  html(:blog, :index, title="Blog", posts=results)
end

function filter()
  results = Vector{Post}()
  tag = params(:tag)

  foreach(Posts) do post
    if (tag in post.tags)
      push!(results, post)
    end
  end

  html(:blog, :index, title="Blog", posts=results, tags=Tags)
end

end
