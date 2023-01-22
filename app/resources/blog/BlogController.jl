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
  html(:blog, :index, title = "index", posts = Posts)
end

function blogpost(link::SubString{String})
  pst_index = findfirst(x -> x.link == link, Posts)
  if (!isnothing(pst_index))
    pst = getindex(Posts, pst_index)
  date = Dates.format(pst.date, "E, d U Y")
  html(:blog, "posts/" * pst.filename, post = pst, sdate = date)
  end
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

  html(:blog, :index, title = "Blog", posts = results, tags = Tags)
end

function filter()
  results = Vector{Post}()
  tag = params(:tag)

  foreach(Posts) do post
    if (tag in post.tags)
      push!(results, post)
    end
  end

  html(:blog, :index, title = "Blog", posts = results, tags = Tags)
end

end
