module CommentsController

using Genie.Renderer.Html, Genie.Requests, SearchLight, Motregen.Comments
import Markdown

function guestbook()
  html(:comments, :guestbook, comments = all(Comment, order = SQLOrder(:id, "DESC")), layout = :guestbook)
end

function create()
  sanitized_text = Markdown.htmlesc(postpayload(:text)) |> strip
  Comment(name = postpayload(:name), text = sanitized_text, page = postpayload(:page)) |> save && redirect("/guestbook") 
end

end
