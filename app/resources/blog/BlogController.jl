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

"""
Loading blog posts.
"""

function htmlposts()
  push!(Posts, Post("my 2023 focus for art", "-", "art", Date(2023-01-07), "my-2023-focus-for-art", "230107_art_goals.jl.html"))
end

function mdposts()
  if (isempty(Posts))
    post_names = readdir("app/resources/blog/views/posts")
    foreach(post_names) do post_name
      data = YAML.load_file("app/resources/blog/views/posts/" * post_name)
      push!(Posts, Post(data["title"], data["description"], data["category"], data["date"], data["link"], post_name))
    end
    reverse!(Posts)
  end
end

"""
Rendering web pages.
"""

function index()
  html(:blog, :index, title="index", posts=Posts, sdate="")
end

function blogpost(link::String)
  post_index = findfirst(x -> x.link == link, Posts)
  post = getindex(Posts, post_index)
  date = Dates.format(post.date, "E, d U Y")
  html(:blog, "posts/" * post.filename, post=post, sdate=date)
end

"""
Filtering, searching, paging.
"""

function search()
  isempty(strip(params(:query))) && redirect(:index)

  results = Vector{Post}()
  query = lowercase(params(:query))

  foreach(Posts) do post
    if (occursin(query, lowercase(post.title)) | occursin(query, lowercase(post.description)))
      push!(results, post)
    end
  end

  html(:blog, :index, title="..." * query, posts=results)
end

function category(category::String)
  results = Posts
  filter!(c -> c.category == category, results)
  html(:blog, :index, title=category, posts=results)
end

"""
Functions for debugging purposes.
"""

function refresh()
  empty!(Posts)
  initialize()
end

end
