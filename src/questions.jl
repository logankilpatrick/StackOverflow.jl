using StackOverflow

"""
    makequestionsarray(json_obj::Dict)

Returns a Vector of `Question`s extracted from a json object from stackexchange API.
"""
function makequestionsarray(json_obj::Dict)
    questionholder = Vector()
    for (k, v) in json_obj
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
                end

                question = Question(link, view_count, creation_date, is_answered, owner,
                        last_activity_date, score, accepted_answer_id, question_id, tags, title,
                        answer_count)
                push!(questionholder, question)

            end
        end
    end
    questionholder
end


"""
    getrecentquestionsfortag(;tag::String = "Julia", site::String = "stackoverflow", order::String = "desc",
                                    sort::String = "activity", todate::String = "", fromdate::String = "")

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
    questionholder = makequestionsarray(json)
end



"""
    getquestionfromanswer(ans::Answer; sort::String = "activity", order::String = "desc")

Returns a `Vector` of `Question`s whose one of the answers is `ans` of type `Answer`.
"""
function getquestionfromanswer(ans::Answer; sort::String = "activity", order::String = "desc")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/answers/$(ans.answer_id)/questions?order=$(order)&sort=$(sort)&site=stackoverflow")
    json = convert_HTTP_Response_To_JSON(r)
    questionholder = makequestionsarray(json)
end
