module BlogController

using Genie.Router, Genie.Renderer.Html, Dates, YAML

struct Post
  title::String
  category::String
  date::Date
  link::String
  filename::String
end

Posts = Vector{Post}()

"""
Loading blog posts.
"""

function initialize()
  if (isempty(Posts))
    post_names = readdir("app/resources/blog/views/posts")
    foreach(post_names) do post_name
      data = YAML.load_file("app/resources/blog/views/posts/" * post_name)
      push!(Posts, Post(data["title"], data["category"], data["date"], replace(data["title"], " " => "-"), post_name))
    end
    reverse!(sort!(Posts, by = post -> post.date)) # Reverse chronological order
  end
end

"""
Dutch date names.
"""

dutch_months = ["januari", "februari", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december"]
dutch_months_abbrev = ["jan.", "feb.", "mrt.", "apr.", "mei", "jun.", "jul.", "aug.", "sep.", "okt.", "nov.", "dec."]
dutch_days = ["maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag", "zondag"]

Dates.LOCALES["dutch"] = Dates.DateLocale(dutch_months, dutch_months_abbrev, dutch_days, [""])

"""
Rendering web pages.
"""

function index()
  html(:blog, :index, title="index", posts=Posts, sdate="")
end

function index_category(category::String)
  html(:blog, :index, title=category, posts=get_by_category(category), sdate="")
end

function blogpost(link::String)
  post_index = findfirst(x -> x.link == link, Posts)
  post = getindex(Posts, post_index)
  date = Dates.format(post.date, "E, d U Y", locale="dutch")
  html(:blog, "posts/" * post.filename, post=post, sdate=date)
end

"""
Searching, filtering, paging.
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

function get_by_category(category::String)
  return filter(c -> c.category == category, Posts)
end

function pagination(page::Int, limit::Int)
  offset = (page - 1) * limit
  pages = ceil(Int, length(Posts) / limit)
  if (page > pages)
    page = pages
    offset = (page - 1) * limit
  end
  return Posts[offset+1:offset+limit], pages
end

"""
Functions for debugging purposes.
"""

function refresh()
  empty!(Posts)
  initialize()
end

end
