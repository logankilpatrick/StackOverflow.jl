using StackOverflow


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
