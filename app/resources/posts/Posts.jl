module Posts

export Post

@kwdef mutable struct Post <: AbstractModel
    title::String
    description::String
    text::String
    tags::String # ?
    created_at::DateTime
    last_edited::DateTime
end

end
