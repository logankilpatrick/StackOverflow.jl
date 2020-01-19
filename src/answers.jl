using StackOverflow




"""
    makeanswersarray(json_obj::Dict)

Returns a Vector of `Answer` type extracted from a json object from stackexchange API.
"""
function makeanswersarray(json_obj::Dict)
    answerholder = Vector()
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                creation_date = 0
                owner = Dict()
                last_activity_date = 0
                score = 0
                question_id = 0
                answer_id = 0
                locked_date = 0
                community_owned_date = 0
                is_accepted = 0
                last_edit_date = 0

                for (key, value) in item
                    if occursin("locked_date", key)
                        locked_date = value
                    elseif occursin("community_owned_date", key)
                        community_owned_date = value
                    elseif occursin("creation_date", key)
                        creation_date = value
                    elseif occursin("last_edit_date", key)
                        last_edit_date = value
                    elseif occursin("owner", key)
                        owner = value
                    elseif occursin("last_activity_date", key)
                        last_activity_date = value
                    elseif occursin("score", key)
                        score = value
                    elseif occursin("answer_id", key)
                        answer_id = value
                    elseif occursin("question_id", key)
                        question_id = value
                    end
                end
                answer = Answer(owner,
                 is_accepted,
                 score,
                 last_activity_date,
                 last_edit_date,
                 community_owned_date,
                 locked_date,
                 creation_date,
                 answer_id,
                 question_id
                 )
                push!(answerholder, answer)

            end
        end
    end
    answerholder
end


"""
    getquestions(sort::string = "creation", order::String = "desc")

Returns 30 most recent answers given a certain sort parameter.
"""
function getanswers(sort::String = "creation", order::String = "desc")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/answers?order=$(order)&sort=$(sort)&site=stackoverflow")

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    answers = makeanswersarray(json_obj)

end

"""
    getanswerforquestion(q::Question; sort::String = "activity", order::String = "desc")

Returns a `Vector` of `Answer`s belonging to a `Question` `q`.
"""
function getanswerfromquestion(q::Question; sort::String = "activity", order::String = "desc")
    q_id = q.question_id
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions/$(q_id)/answers?order=$(order)&sort=$(sort)&site=stackoverflow")
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    answers = makeanswersarray(json_obj)
end
