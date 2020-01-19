using StackOverflow

"""
    getopenquestions(page::Int = 1, pagesize::Int = 1, fromdate::String = "", todate::String = "",
                            order::String = "desc", sort::String = "activity", tags::String = "Julia",
                            site::String = "stackoverflow")

Will return questions that have no marked answer given a tag. `pagesize` is the number of questions it will return,
`page` is the page on which it takes questions from, and returns `pagesize` number of questions.

Possible order values: "desc" or "asc"
Possible sort values: "activity", "votes", "creation", "hot", "week", or "month"
"""
function getopenquestions(page::Int = 1, pagesize::Int = 1, fromdate::String = "", todate::String = "",
                                order::String = "desc", sort::String = "activity", tags::String = "Julia",
                                site::String = "stackoverflow")
    tags = replace(tags, " " => "%20")

    if fromdate != "" && todate != ""
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions/unanswered?page=$page&pagesize=$pagesize&fromdate=$fromdate&todate=$todate&order=$order&sort=$sort&tagged=$tags&site=$site")
    else
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions/unanswered?page=$page&pagesize=$pagesize&order=$order&sort=$sort&tagged=$tags&site=$site")
    end

    json = StackOverflow.convert_HTTP_Response_To_JSON(r)

    questionholder = Vector()
    for (k, v) in json
        if occursin("items", k)
            for item in v
                link = ""
                view_count = 0
                creation_date = 0
                is_answered = false
                owner = Dict()
                last_activity_date = 0
                score = 0
                accepted_answer_id = 0
                question_id = 0
                title = 0
                answer_count = 0
                tags = []
                title = ""

                for (key, value) in item
                    if occursin("link", key)
                        link = value
                    elseif occursin("view_count", key)
                        view_count = value
                    elseif occursin("creation_date", key)
                        creation_date = value
                    elseif occursin("is_answered", key)
                        is_answered = value
                    elseif occursin("owner", key)
                        owner = value
                    elseif occursin("last_activity_date", key)
                        last_activity_date = value
                    elseif occursin("score", key)
                        score = value
                    elseif occursin("accepted_answer_id", key)
                        accepted_answer_id = value
                    elseif occursin("question_id", key)
                        question_id = value
                    elseif occursin("tags", key)
                        tags = value
                    elseif occursin("title", key)
                        title = value
                    elseif occursin("answer_count", key)
                        answer_count = value
                    end
                    # println(key)
                end
                question = StackOverflow.Questions(link, view_count, creation_date, is_answered, owner,
                    last_activity_date, score, accepted_answer_id, question_id, tags, title,
                    answer_count)

                push!(questionholder, question)
            end

        end
    end    
    return questionholder
end
