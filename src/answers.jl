using StackOverflow



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
function getanswerforquestion(q::Question; sort::String = "activity", order::String = "desc")
    q_id = q.question_id
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions/$(q_id)/answers?order=$(order)&sort=$(sort)&site=stackoverflow")
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    answers = makeanswersarray(json_obj)
end
