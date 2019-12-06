using StackOverflow

mutable struct SiteInfo
    new_active_users::Int
    total_users::Int
    badges_per_minute::Float32
    total_badges::Int
    total_votes::Int
    total_comments::Int
    answers_per_minute::Float32
    questions_per_minute::Float32
    total_answers::Int
    total_accepted::Int
    total_unanswered::Int
    total_questions::Int
    api_revision::String
end

"""
    getrecentquestionsfortag(;tag::String = "Julia", site::String = "stackoverflow", order::String = "desc",
                                    sort::String = "activity", todate::String = "", fromdate::String = "")

Will return the 30 StackOverflow questions given a certain tag and sort parameter.

Possible order values: "desc" or "asc"
Possible sort values: "activity", "votes", "creation", "hot", "week", or "month"
"""
function getsiteinfo(;site::String = "stackoverflow")


    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/info?$(site)/")

    r_json = convert_HTTP_Response_To_JSON(r)

    println(r_json)
    # for (k, v) in r_json
    #     println(k, v)
    # end

    # for (k, v) in r_json
    #     if occursin("items", k)
    #         for item in v

    #             link                = Vector()
    #             view_count          = Vector()
    #             creation_date       = Vector()
    #             is_answered         = Vector()
    #             owner               = Vector()
    #             last_activity_date  = Vector()
    #             score               = Vector()
    #             accepted_answer_id  = Vector()
    #             question_id         = Vector()
    #             tags                = Vector()
    #             title               = Vector()
    #             answer_count        = Vector()

    #             for (key, value) in item
    #                 if occursin("link", key)
    #                     push!(link, value)
    #                 elseif occursin("view_count", key)
    #                     push!(view_count, value)
    #                 elseif occursin("creation_date", key)
    #                     push!(creation_date, value)
    #                 elseif occursin("is_answered", key)
    #                     push!(is_answered, value)
    #                 elseif occursin("owner", key)
    #                     push!(owner, value)
    #                 elseif occursin("last_activity_date", key)
    #                     push!(last_activity_date, value)
    #                 elseif occursin("score", key)
    #                     push!(score, value)
    #                 elseif occursin("accepted_answer_id", key)
    #                     push!(accepted_answer_id, value)
    #                 elseif occursin("question_id", key)
    #                     push!(question_id, value)
    #                 elseif occursin("tags", key)
    #                     push!(tags, value)
    #                 elseif occursin("title", key)
    #                     push!(title, value)
    #                 elseif occursin("answer_count", key)
    #                     push!(answer_count, value)
    #                 end
    #                 # println(key)
    #             end
    #             question = Questions(link, view_count, creation_date, is_answered, owner,
    #                 last_activity_date, score, accepted_answer_id, question_id, tags, title,
    #                 answer_count)

    #             push!(questionholder, question)
    #         end

    #         println(r_json)
    #     end
    # end

end