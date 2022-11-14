module Comments

using SearchLight, Dates, Motregen.CommentsValidator

import SearchLight: AbstractModel, DbId
import SearchLight.Validation: ModelValidator, ValidationRule
import Base: @kwdef

export Comment

@kwdef mutable struct Comment <: AbstractModel
  id::DbId = DbId()
  name::String = ""
  text::String = ""
  created_at::DateTime = Dates.now()
  page::String = ""
end

function SearchLight.Validation.validator(::Type{Comment})
  ModelValidator([
    ValidationRule(:name, CommentsValidator.not_empty)
    ValidationRule(:text, CommentsValidator.not_empty)
    ValidationRule(:page, CommentsValidator.not_empty)
  ])
end

end
