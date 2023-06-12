module CommentsController

using Genie.Renderer.Html, Genie.Requests, Genie.Exceptions, SearchLight, ..Main.UserApp.Comments
import Markdown

function guestbook()
  html(:comments, :guestbook, comments=all(Comment, order=SQLOrder(:id, "DESC")), layout=:guestbook)
end

function create()
  sanitized_name::String = sanitize(postpayload(:name))
  sanitized_text::String = sanitize(postpayload(:text))
  sanitized_page::String = sanitize(postpayload(:page))

  comment = Comment(name=sanitized_name, text=sanitized_text, page=sanitized_page)
  if save(comment)
    redirect(:guestbook)
  else
    throw(ExceptionalResponse(redirect(:guestbook)))
  end
end

function sanitize(text::String)
  Markdown.htmlesc(text) |> strip
end

end
