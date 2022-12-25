module IllustrationsController

using Genie.Renderer.Html, Dates

struct Illustration
  title::String
  tags::Vector{String}
  file_name::String
  # path::String = "/img/illustrations/" + file_name
  date::Date
end

const Illustrations = Illustration[
  Illustration("John Frusciante in the 90s, painted", ["digital", "realism"], "frusciante-colour.jpg", Date("2022-01-16")),
  Illustration("Simple pen sketch", ["traditional", "stylized"], "lief.jpg", Date("2021-01-10"))
]

function gallery()
  html(:illustrations, :gallery, illustrations = Illustrations, layout = :gallery)
end

end
