module StackOverflow

using HTTP
using CodecZlib
using JSON

mutable struct Answer
    owner::Dict
    is_accepted::Bool
    score::Int
    last_activity_date::Int
    last_edit_date::Int
    community_owned_date::Int
    locked_date::Int
    creation_date::Int
    answer_id::Int
    question_id::Int
end

mutable struct Question
    link::String
    view_count::Int
    creation_date::Int
    is_answered::Bool
    owner::Dict
    last_activity_date::Int
    score::Int
    accepted_answer_id::Int
    question_id::Int
    tags::Vector
    title::String
    answer_count::Int
end

include("questions.jl")
export
    getrecentquestionsfortag
    getquestionfromanswer

include("privileges.jl")
export
    checkmyprivileges,
    getprivileges

include("utils.jl")
export
    convert_HTTP_Response_To_JSON

include("answers.jl")
export
    getanswers
    getanswerfromquestion

include("badges.jl")
export
    getrecentbadgerecipients

include("siteinfo.jl")
export
    getsiteinfo

include("search.jl")
export
    searcherror

include("tags.jl")
export
    searchtag

end # module
