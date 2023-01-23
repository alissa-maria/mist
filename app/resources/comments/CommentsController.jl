module CommentsController

using Genie.Renderer.Html, Genie.Requests, SearchLight, Motregen.Comments
import Markdown

function guestbook()
  html(:comments, :guestbook, comments=all(Comment, order=SQLOrder(:id, "DESC")), layout=:guestbook)
end

function create()
  sanitized_name::String = sanitize(postpayload(:name))
  sanitized_text::String = sanitize(postpayload(:text))
  sanitized_page::String = sanitize(postpayload(:page))

  with(Comment(name=sanitized_name, text=sanitized_text, page=sanitized_page)) do comment
    save(comment)
    redirect("/guestbook", status_code=302) # route should not be hardcoded
  end
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
