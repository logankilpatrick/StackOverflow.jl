using StackOverflow

mutable struct Questions
    link::Vector
    view_count::Vector
    creation_date::Vector
    is_answered::Vector
    owner::Vector
    last_activity_date::Vector
    score::Vector
    accepted_answer_id::Vector
    question_id::Vector
    tags::Vector
    title::Vector
    answer_count::Vector
end

"""
    getrecentquestionsfortag(tag::String = "Julia", site::String = "stackoverflow", order::String = "desc",
                                    sort::String = "activity")

Will return the 30 StackOverflow questions given a certain tag and sort parameter.

Possible order values: "desc" or "asc"
Possible sort values: "activity", "votes", "creation", "hot", "week", or "month"
"""
function getrecentquestionsfortag(;tag::String = "Julia", site::String = "stackoverflow", order::String = "desc",
                                    sort::String = "activity", todate::String = "", fromdate::String = "")

    questionholder = Vector()

    if fromdate != "" && todate != ""
        datequery = "fromdate=$(fromdate)&todate=$(todate)&"  #?fromdate=1573776000&todate=1574467200&order
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions?$(datequery)order=$(order)&sort=$(sort)&tagged=$(tag)&site=$(site)")
    else
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions?order=$(order)&sort=$(sort)&tagged=$(tag)&site=$(site)")
    end

    json = convert_HTTP_Response_To_JSON(r)

    for (k, v) in json
        if occursin("items", k)
            for item in v

                link                = Vector()
                view_count          = Vector()
                creation_date       = Vector()
                is_answered         = Vector()
                owner               = Vector()
                last_activity_date  = Vector()
                score               = Vector()
                accepted_answer_id  = Vector()
                question_id         = Vector()
                tags                = Vector()
                title               = Vector()
                answer_count        = Vector()

                for (key, value) in item
                    if occursin("link", key)
                        push!(link, value)
                    elseif occursin("view_count", key)
                        push!(view_count, value)
                    elseif occursin("creation_date", key)
                        push!(creation_date, value)
                    elseif occursin("is_answered", key)
                        push!(is_answered, value)
                    elseif occursin("owner", key)
                        push!(owner, value)
                    elseif occursin("last_activity_date", key)
                        push!(last_activity_date, value)
                    elseif occursin("score", key)
                        push!(score, value)
                    elseif occursin("accepted_answer_id", key)
                        push!(accepted_answer_id, value)
                    elseif occursin("question_id", key)
                        push!(question_id, value)
                    elseif occursin("tags", key)
                        push!(tags, value)
                    elseif occursin("title", key)
                        push!(title, value)
                    elseif occursin("answer_count", key)
                        push!(answer_count, value)
                    end
                    # println(key)
                end
                question = Questions(link, view_count, creation_date, is_answered, owner,
                    last_activity_date, score, accepted_answer_id, question_id, tags, title,
                    answer_count)

                push!(questionholder, question)
            end

            return questionholder
        end
    end

end
